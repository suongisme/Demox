package cartitem.impl;

import DAO.MatchScheduleDAO;
import DAO.TeamDAO;
import DAO.TicketDAO;
import Model.MatchSchedule;
import Model.Team;
import cartitem.ICartItemService;
import dto.CartItem;
import dto.MatchScheduleDTO;
import exception.DuplicateException;
import payment.IPaymentService;
import payment.PaymentFactory;
import utils.DateUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

public class TicketCartItemService implements ICartItemService {

    private final TicketDAO ticketDAO;
    private final MatchScheduleDAO matchScheduleDAO;
    private final TeamDAO teamDAO;

    public TicketCartItemService(
        TicketDAO ticketDAO,
        MatchScheduleDAO matchScheduleDAO,
        TeamDAO teamDAO
    ) {
        this.ticketDAO = ticketDAO;
        this.matchScheduleDAO = matchScheduleDAO;
        this.teamDAO = teamDAO;
    }

    @Override
    public void purchase(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            final String methodPayment = "vnpay";
            req.setAttribute("paymentMethod", methodPayment);
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

    @Override
    public List<CartItem> get(Collection<? extends Number> ids) {
        final Map<Integer, MatchSchedule> matchScheduleMap = this.matchScheduleDAO.getAll().stream().collect(Collectors.toMap(
            MatchSchedule::getMatchID,
            Function.identity()
        ));
        final Map<Integer, Team> teamMap = this.teamDAO.getAll().stream().collect(Collectors.toMap(
            Team::getTeamID,
            Function.identity()
        ));
        return this.ticketDAO.getByIds(ids).stream().map(x -> {
            final MatchSchedule matchSchedule = matchScheduleMap.get(x.getMatchId());
            final Team awayTeam = teamMap.get(matchSchedule.getAwayTeamID());
            final Team homeTeam = teamMap.get(matchSchedule.getHomeTeamID());
            MatchScheduleDTO matchScheduleDTO = new MatchScheduleDTO();
            matchScheduleDTO.setHomeTeamName(homeTeam.getTeamName());
            matchScheduleDTO.setAwayTeamName(awayTeam.getTeamName());
            matchScheduleDTO.setLocation(matchSchedule.getMatchLocation());
            matchScheduleDTO.setMatchDate(matchSchedule.getMatchDate());
            matchScheduleDTO.setTickets(List.of(x));
            return new CartItem(
                x.getTicketId(),
                matchScheduleDTO,
                x.getPrice()
            );

        }).collect(Collectors.toList());
    }

}
