package Servlet;

import DAO.MatchScheduleDAO;
import DAO.TeamDAO;
import DAO.TicketDAO;
import DAO.TicketPurchaseDAO;
import Model.MatchSchedule;
import Model.Team;
import Model.Ticket;
import Model.TicketPurchase;
import constant.AppConstant;
import dto.MatchScheduleDTO;
import exception.DuplicateException;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import payment.IPaymentService;
import payment.PaymentFactory;
import utils.DateUtils;
import utils.VnpayUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@WebServlet(name = "ticket-servlet", urlPatterns = "/ticket/*")
public class TicketServlet extends HttpServlet {

    private MatchScheduleDAO matchScheduleDAO = null;
    private TeamDAO teamDAO = null;
    private TicketDAO ticketDAO;
    private TicketPurchaseDAO ticketPurchaseDAO;

    private Properties properties;

    @Override
    public void init() throws ServletException {
        super.init();
        this.matchScheduleDAO = new MatchScheduleDAO();
        this.teamDAO = new TeamDAO();
        this.ticketDAO = new TicketDAO();
        this.ticketPurchaseDAO = new TicketPurchaseDAO();
        this.properties = (Properties) this.getServletContext().getAttribute(AppConstant.APPLICATION_CONFIG_KEY);
    }

    @Override
    protected void doGet(
        HttpServletRequest req,
        HttpServletResponse resp
    ) throws ServletException, IOException {
        final String pathInfo = req.getPathInfo();
        if (StringUtils.isBlank(pathInfo)) {
            final List<MatchSchedule> matchSchedules = matchScheduleDAO.getAll();
            final Map<Integer, Team> teamMap = this.teamDAO.getAll().stream().collect(Collectors.toMap(
                Team::getTeamID,
                Function.identity()
            ));
            final Map<Integer, List<Ticket>> ticketMap = this.ticketDAO.getAll().stream()
                .collect(Collectors.groupingBy(Ticket::getMatchId));
            final Map<Integer, TicketPurchase> ticketPurchaseMap = this.ticketPurchaseDAO.getAll().stream()
                .collect(Collectors.toMap(
                    TicketPurchase::getTicketID,
                    Function.identity()
                ));
            final Map<String, List<MatchScheduleDTO>> matchScheduleDtoList = matchSchedules.stream().map(x -> {
                final Team awayTeam = teamMap.get(x.getAwayTeamID());
                final Team homeTeam = teamMap.get(x.getHomeTeamID());

                MatchScheduleDTO matchScheduleDTO = new MatchScheduleDTO();
                matchScheduleDTO.setMatchDate(x.getMatchDate());
                matchScheduleDTO.setMatchID(x.getMatchID());
                matchScheduleDTO.setAwayTeamID(x.getAwayTeamID());
                matchScheduleDTO.setLocation(x.getMatchLocation());
                matchScheduleDTO.setHomeTeamID(x.getHomeTeamID());
                matchScheduleDTO.setHomeTeamName(homeTeam.getTeamName());
                matchScheduleDTO.setAwayTeamName(awayTeam.getTeamName());
                matchScheduleDTO.setTickets(ticketMap.get(x.getMatchID()));
                matchScheduleDTO.setHomeTeamLogo(homeTeam.getFlag());
                matchScheduleDTO.setAwayTeamLogo(awayTeam.getFlag());
                matchScheduleDTO.setTicketPurchaseMap(ticketPurchaseMap);
                matchScheduleDTO.setTournament(x.getTournament());
                return matchScheduleDTO;
            }).collect(Collectors.groupingBy(x -> DateUtils.format(
                x.getMatchDate(),
                "MMMM yyyy"
            )));
            req.setAttribute(
                "matchSchedules",
                matchScheduleDtoList
            );
            req.getRequestDispatcher("HOME/ticket.jsp").forward(
                req,
                resp
            );
            return;
        }

        switch (pathInfo) {
            case "/paid":
                final String vnpTmnCode = req.getParameter("vnp_TmnCode");
                final String vnpResponseCode = req.getParameter("vnp_ResponseCode");
                final String vnpTxnRef = req.getParameter("vnp_TxnRef"); //
                // cai nay la
                // purchaseID nè.
                final String tmnCode = this.properties.getProperty("vnpay.tmn-code");
                final String transactionStatus = req.getParameter("vnp_TransactionStatus");

                if (!"00".equals(transactionStatus)) {
                    this.ticketPurchaseDAO.delete(Integer.parseInt(vnpTxnRef));
                    resp.sendRedirect(req.getContextPath() + "/ticket");
                    return;
                }


                Map<String, String> fields = new HashMap<>();
                for (Enumeration<String> params = req.getParameterNames(); params.hasMoreElements(); ) {
                    String fieldName = URLEncoder.encode(
                        params.nextElement(),
                        StandardCharsets.US_ASCII
                    );
                    String fieldValue = URLEncoder.encode(
                        req.getParameter(fieldName),
                        StandardCharsets.US_ASCII
                    );
                    if ((fieldValue != null) && (!fieldValue.isEmpty())) {
                        fields.put(
                            fieldName,
                            fieldValue
                        );
                    }
                }
                String vnp_SecureHash = req.getParameter("vnp_SecureHash");
                fields.remove("vnp_SecureHashType");
                fields.remove("vnp_SecureHash");
                String signValue = VnpayUtils.hashAllFields(
                    this.properties.getProperty("vnpay.secret-key"),
                    fields
                );

                if (signValue.equals(vnp_SecureHash)) {
                    if ("00".equals(vnpResponseCode) && tmnCode.equals(vnpTmnCode)) {
                        TicketPurchase ticketPurchase = new TicketPurchase();
                        ticketPurchase.setStatus(1);
                        ticketPurchase.setPurchaseID(NumberUtils.toInt(vnpTxnRef));
                        this.ticketPurchaseDAO.updateBatch(Collections.singletonList(ticketPurchase));
                        resp.sendRedirect(req.getContextPath() + "/ticket");
                    }
                }
        }

    }

    @Override
    protected void doPost(
        HttpServletRequest req,
        HttpServletResponse resp
    ) throws ServletException, IOException {
        final String pathInfo = req.getPathInfo();
        if (Objects.nonNull(pathInfo)) {
            switch (pathInfo) {
                case "/purchase":
                    this.purchaseTicket(
                        req,
                        resp
                    );
                    break;
            }
        }
    }

    public void purchaseTicket(
        HttpServletRequest req,
        HttpServletResponse resp
    ) throws IOException {
        try {
            final String methodPayment = req.getParameter("paymentMethod");
            final IPaymentService paymentService = PaymentFactory.getPaymentService(methodPayment);
            paymentService.payment(
                req,
                resp
            );
        } catch (DuplicateException ex) {
            resp.sendRedirect("/ticket?error=" + URLEncoder.encode(
                ex.getMessage(),
                StandardCharsets.UTF_8
            ));
        }
    }
}
