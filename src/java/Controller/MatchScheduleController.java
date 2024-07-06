package Controller;

import DAO.MatchScheduleDAO;
import DAO.TeamDAO;
import Model.MatchSchedule;
import Model.Team;
import Model.Tournament;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.microsoft.sqlserver.jdbc.SQLServerException;
import utils.DateUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MatchScheduleController extends HttpServlet {

    protected void processRequest(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
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

    @Override
    protected void doGet(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws ServletException, IOException {
        try {
            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "LIST";
            }
            switch (theCommand) {
                case "LIST":
                    response.sendRedirect("/SWPClubManegement/ADMIN/adminListMatchSchedule.jsp");
                    break;
                case "ADD":
                    AddMatch(
                        request,
                        response
                    );
                    break;
                case "UPDATE":
                    UpdateMatch(
                        request,
                        response
                    );
                    break;
                case "DELETE":
                    DeleteMatch(
                        request,
                        response
                    );
                    break;
                default:
            }
        } catch (Exception ex) {
            Logger.getLogger(PlayerController.class.getName()).log(
                Level.SEVERE,
                null,
                ex
            );
        }
    }

    @Override
    protected void doPost(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws ServletException, IOException {
        ListMatch(
            request,
            response
        );
    }

    @Override
    protected void doDelete(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws ServletException, IOException {
        try {
            DeleteMatch(
                request,
                response
            );
        } catch (SQLServerException ex) {
            Logger.getLogger(MatchScheduleController.class.getName()).log(
                Level.SEVERE,
                null,
                ex
            );
        }
    }

    public void ListMatch(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        try {
            MatchScheduleDAO mdao = new MatchScheduleDAO();
            TeamDAO tdao = new TeamDAO();
            List<Team> homeTeam = new ArrayList<>();
            List<Team> awayTeam = new ArrayList<>();
            String searchValue = request.getParameter("search");
            List<MatchSchedule> matches;
            List<MatchSchedule> matchesAlreadyStats = mdao.getMatchAlreadyStatistic();

            if (searchValue == null) {
                matches = mdao.getAll();
            } else {
                matches = mdao.SearchMatch(searchValue);
            }

            for (MatchSchedule m : matches) {
                homeTeam.add(tdao.get(m.getHomeTeamID()).get());
                awayTeam.add(tdao.get(m.getAwayTeamID()).get());
            }

            Gson gson = new Gson();
            JsonObject json = new JsonObject();
            json.add(
                "matches",
                gson.toJsonTree(matches)
            );
            json.add(
                "homeTeam",
                gson.toJsonTree(homeTeam)
            );
            json.add(
                "awayTeam",
                gson.toJsonTree(awayTeam)
            );
            json.add(
                "matchAlreadyStats",
                gson.toJsonTree(matchesAlreadyStats)
            );

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json.toString());
            response.getWriter().flush();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void AddMatch(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws IOException {
        try {
            MatchScheduleDAO mdao = new MatchScheduleDAO();
            MatchSchedule ms = new MatchSchedule();

            int awayTeam = Integer.parseInt(request.getParameter("awayteam"));
            int homeTeam = Integer.parseInt(request.getParameter("hometeam"));
            String location = request.getParameter("location");

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate matchDate = LocalDate.parse(
                request.getParameter("matchdate"),
                formatter
            );
            Tournament tour = Tournament.valueOf(request.getParameter("tour"));

            ms.setAwayTeamID(awayTeam);
            ms.setHomeTeamID(homeTeam);
            ms.setMatchLocation(location); // Set the match location
            ms.setMatchDate(DateUtils.localDateToDate(matchDate));
            ms.setTournament(tour);

            mdao.save(ms);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void UpdateMatch(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws IOException {
        try {
            MatchScheduleDAO mdao = new MatchScheduleDAO();
            MatchSchedule ms = new MatchSchedule();

            int matchID = Integer.parseInt(request.getParameter("mid"));
            int awayTeam = Integer.parseInt(request.getParameter("awayteam1"));
            int homeTeam = Integer.parseInt(request.getParameter("hometeam1"));
            String location = request.getParameter("matchlocation");

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate matchDate = LocalDate.parse(
                request.getParameter("matchdate1"),
                formatter
            );
            Tournament tour = Tournament.valueOf(request.getParameter("tour1"));

            ms.setMatchID(matchID);
            ms.setAwayTeamID(awayTeam);
            ms.setHomeTeamID(homeTeam);
            ms.setMatchLocation(location); // Set the match location
            ms.setMatchDate(DateUtils.localDateToDate(matchDate));
            ms.setTournament(tour);

            mdao.update(ms);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void DeleteMatch(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws IOException, SQLServerException {
        try {
            int matchID = Integer.parseInt(request.getParameter("mid"));
            Gson gson = new Gson();
            MatchScheduleDAO mdao = new MatchScheduleDAO();
            List<MatchSchedule> matches = mdao.getAll();

            if (mdao.deleteB(matchID)) {
                String json = gson.toJson(matches);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                response.getWriter().flush();
            } else {
                String json = gson.toJson("fail");
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                response.getWriter().flush();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
