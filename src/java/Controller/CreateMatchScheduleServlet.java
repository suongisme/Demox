package Controller;

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
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.logging.Logger;

@WebServlet(name = "CreateMatchScheduleServlet", urlPatterns = {"/CreateMatchScheduleServlet"})
public class CreateMatchScheduleServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(CreateMatchScheduleServlet.class.getName());

    protected void processRequest(
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
        request.setAttribute(
            "currentDate",
            LocalDate.now()
        );
        request.setAttribute(
            "matches",
            matches
        );

        request.getRequestDispatcher("HOME/match.jsp").forward(
            request,
            response
        );
    }

    @Override
    protected void doGet(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws ServletException, IOException {
        processRequest(
            request,
            response
        );
    }

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

    @Override
    public String getServletInfo() {
        return "Servlet to create match schedules";
    }
}
