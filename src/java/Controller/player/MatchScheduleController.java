/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.player;

import DAO.MatchScheduleDAO;
import DAO.MatchStatisticDAO;
import DAO.TeamDAO;
import Model.MatchSchedule;
import Model.MatchStatistic;
import Model.Team;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

/**
 * @author quangminh
 */
@WebServlet(name = "MatchSchedulePlayer", urlPatterns = {"/MatchSchedulePlayer"})
public class MatchScheduleController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MatchScheduleController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MatchScheduleController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws ServletException, IOException {
        MatchScheduleDAO mdao = new MatchScheduleDAO();
        MatchStatisticDAO msdao = new MatchStatisticDAO();
        TeamDAO tdao = new TeamDAO();
        List<MatchSchedule> matches = null;
        matches = mdao.getAll();
        for (MatchSchedule m : matches) {
            Optional<Team> homeTeam = tdao.get(m.getHomeTeamID());
            Team homeTeams = homeTeam.orElse(null);
            m.setHomeTeam(homeTeams);
            Optional<Team> AwayTeams = tdao.get(m.getAwayTeamID());
            Team AwayTeam = AwayTeams.orElse(null);
            m.setAwayTeam(AwayTeam);

            //
            Optional<MatchStatistic> homes = msdao.getByTeamIdAndMatchId(
                m.getHomeTeamID(),
                m.getMatchID()
            );
            MatchStatistic home = homes.orElse(null);
            m.setMatchHomeTeam(home);
            Optional<MatchStatistic> Aways = msdao.getByTeamIdAndMatchId(
                m.getAwayTeamID(),
                m.getMatchID()
            );
            MatchStatistic Away = Aways.orElse(null);
            m.setMatchAwayTeam(Away);
            //                    mstList.add(mstdao.get(m.getMatchID()).get());
        }
        System.out.println("---------------------------------");
        System.out.println(matches);
        request.getSession().setAttribute(
            "currentDate",
            LocalDate.now()
        );
        request.getSession().setAttribute(
            "matchesssses",
            matches
        );
        response.sendRedirect("PLAYER/matchSchedule.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws ServletException, IOException {
        processRequest(
            request,
            response
        );
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}