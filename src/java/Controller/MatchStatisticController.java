/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.MatchScheduleDAO;
import DAO.MatchStatisticDAO;
import DAO.TeamDAO;
import Model.MatchSchedule;
import Model.MatchStatistic;
import Model.Team;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Desktop
 */
public class MatchStatisticController extends HttpServlet {

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
            out.println("<title>Servlet MatchStatisticController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MatchStatisticController at " + request.getContextPath() + "</h1>");
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
        try {

            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "LIST";
            }
            switch (theCommand) {
                case "LIST":

                    response.sendRedirect("/SWPClubManegement/ADMIN/listMatchStatistics.jsp");
                    break;
                case "ADD":
                    AddMatchStat(
                        request,
                        response
                    );
                    break;
                case "LOAD":
                    TeamInput(
                        request,
                        response
                    );
                    break;
                case "UPDATE":
                    UpdateMatchStat(
                        request,
                        response
                    );
                    break;
                case "DELETE":
                    DeleteMatchStat(
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
        try {
            MatchStatisticDAO mstDAO = new MatchStatisticDAO();

            List<MatchStatistic> listMatchStatistic = null;

            MatchScheduleDAO mdao = new MatchScheduleDAO();
            TeamDAO tdao = new TeamDAO();
            List<Team> homeTeam = new ArrayList<>();
            List<Team> awayTeam = new ArrayList<>();
            String searchValue = request.getParameter("search");
            List<MatchSchedule> matches = new ArrayList<>();
            List<Team> listTeams = tdao.getAll();
            if (searchValue == null || searchValue == "") {

                listMatchStatistic = mstDAO.getAll();
                for (MatchStatistic mst : listMatchStatistic) {
                    int mid = mst.getMatchID();
                    matches.add(mdao.get(mid).get());
                }

                for (MatchSchedule m : matches) {
                    homeTeam.add(tdao.get(m.getHomeTeamID()).get());
                    awayTeam.add(tdao.get(m.getAwayTeamID()).get());

                }
            } else {
                listMatchStatistic = mstDAO.SearchByTimeName(searchValue);
                for (MatchStatistic mst : listMatchStatistic) {
                    int mid = mst.getMatchID();
                    matches.add(mdao.get(mid).get());
                }

                for (MatchSchedule m : matches) {
                    homeTeam.add(tdao.get(m.getHomeTeamID()).get());
                    awayTeam.add(tdao.get(m.getAwayTeamID()).get());

                }
            }

            // Chuyển đổi đối tượng bao bọc thành JSON
            // Sử dụng Gson để kiểm tra và chuyển đổi đối tượng bao bọc thành JSON
            Gson gson = new Gson();
            JsonObject json = new JsonObject();
            json.add(
                "matchStatistics",
                gson.toJsonTree(listMatchStatistic)
            );
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
                "teams",
                gson.toJsonTree(listTeams)
            );
            json.add(
                "matchun",
                gson.toJsonTree(mdao.getMatchHaveNotStatistic())
            );
            // Gửi đối tượng JSON dưới dạng phản hồi HTTP
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json.toString());
            response.getWriter().flush();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void TeamInput(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws IOException {
        try {

            MatchScheduleDAO mdao = new MatchScheduleDAO();
            MatchStatisticDAO mtdao = new MatchStatisticDAO();
            TeamDAO tdao = new TeamDAO();
            List<Team> teams = new ArrayList<>();
            int mid = Integer.parseInt(request.getParameter("mid"));

            List<MatchStatistic> listMst = mtdao.GetByMatchID(mid);
            if (listMst.isEmpty()) {
                MatchSchedule match = mdao.get(mid).get();

                teams.add(tdao.get(match.getHomeTeamID()).get());
                teams.add(tdao.get(match.getAwayTeamID()).get());
            } else {
                MatchSchedule match = mdao.get(mid).get();
                int teamExist = listMst.get(0).getTeamID();
                if (match.getAwayTeamID() != teamExist) {
                    teams.add(tdao.get(match.getAwayTeamID()).get());
                }
                if (match.getHomeTeamID() != teamExist) {
                    teams.add(tdao.get(match.getHomeTeamID()).get());
                }

            }

            //           JsonObject json = new JsonObject();
            //           gson.add("teamstat", gson);
            Gson gon = new Gson();
            String gson = gon.toJson(teams);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(gson);
            response.getWriter().flush();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void AddMatchStat(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws IOException {
        try {

            int matchId = Integer.parseInt(request.getParameter("matchId"));
            int teamId = Integer.parseInt(request.getParameter("teamId"));
            int score = Integer.parseInt(request.getParameter("score"));
            int yellow = Integer.parseInt(request.getParameter("yellow"));
            int red = Integer.parseInt(request.getParameter("red"));
            int shot = Integer.parseInt(request.getParameter("shot"));
            int corner = Integer.parseInt(request.getParameter("corner"));
            int passes = Integer.parseInt(request.getParameter("passes"));

            MatchStatisticDAO mtdao = new MatchStatisticDAO();
            MatchStatistic mst = new MatchStatistic(
                matchId,
                teamId,
                score,
                yellow,
                red,
                shot,
                corner,
                0,
                passes
            );
            mtdao.save(mst);
            //           JsonObject json = new JsonObject();
            //           gson.add("teamstat", gson);
            Gson gon = new Gson();
            String gson = gon.toJson(mst);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(gson);
            response.getWriter().flush();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void UpdateMatchStat(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws IOException {
        try {
            int mtid = Integer.parseInt(request.getParameter("mtid"));
            int matchId = Integer.parseInt(request.getParameter("matchId"));
            int teamId = Integer.parseInt(request.getParameter("teamId"));
            int score = Integer.parseInt(request.getParameter("score"));
            int yellow = Integer.parseInt(request.getParameter("yellow"));
            int red = Integer.parseInt(request.getParameter("red"));
            int shot = Integer.parseInt(request.getParameter("shot"));
            int corner = Integer.parseInt(request.getParameter("corner"));
            int passes = Integer.parseInt(request.getParameter("passes"));

            MatchStatisticDAO mtdao = new MatchStatisticDAO();
            MatchStatistic mst = mtdao.get(mtid).get();
            mst.setScore(score);
            mst.setYellowCards(yellow);
            mst.setRedCards(red);
            mst.setTotalShots(shot);
            mst.setCornerKicks(corner);
            mst.setPasses(passes);
            mtdao.update(mst);
            //           JsonObject json = new JsonObject();
            //           gson.add("teamstat", gson);
            Gson gon = new Gson();
            String gson = gon.toJson(mst);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(gson);
            response.getWriter().flush();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void DeleteMatchStat(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws IOException {
        try {
            int mtid = Integer.parseInt(request.getParameter("mtid"));


            MatchStatisticDAO mtdao = new MatchStatisticDAO();
            mtdao.delete(mtid);

            //           JsonObject json = new JsonObject();
            //           gson.add("teamstat", gson);
            Gson gon = new Gson();
            String gson = gon.toJson("success");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(gson);
            response.getWriter().flush();

        } catch (Exception e) {
            e.printStackTrace();
        }

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
