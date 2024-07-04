/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AttendanceDAO;
import DAO.PlayerDAO;
import DAO.TrainingScheduleDAO;
import DAO.UserDAO;
import Model.Attendance;
import Model.Player;
import Model.TrainingSchedule;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Zanis
 */
public class AttendanceServlet extends HttpServlet {

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
            out.println("<title>Servlet AttendanceServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AttendanceServlet at " + request.getContextPath() + "</h1>");
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
                    ListAttendance(
                        request,
                        response
                    );
                    break;
                case "ADD":
                    addAttendance(
                        request,
                        response
                    );
                    break;
                case "STATIS":
                    StatisticsAttendance(
                        request,
                        response
                    );
                    break;
                case "UPDATE":
                    updateAttendance(
                        request,
                        response
                    );
                    break;
                case "DELETE":

                    break;
                default:

            }

        } catch (Exception ex) {

            Logger.getLogger(AttendanceServlet.class.getName()).log(
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

    private void addAttendance(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        AttendanceDAO aDAO = new AttendanceDAO();
        PlayerDAO pDAO = new PlayerDAO();
        String[] playerID = request.getParameterValues("check");
        int TrainingID = Integer.parseInt(request.getParameter("cid"));
        List<Player> listPlayer = pDAO.getAll();
        List<Attendance> listAtten = new ArrayList<>();
        for (Player p : listPlayer) {
            listAtten.add(new Attendance(
                p.getPlayerID(),
                TrainingID,
                LocalDate.now(),
                false
            ));
        }
        for (Attendance a : listAtten) {
            for (String pID : playerID) {
                if (a.getPlayerID() == Integer.parseInt(pID)) {
                    a.setIsPresent(true);
                }
            }
        }
        for (Attendance attendance : listAtten) {
            aDAO.save(attendance);
        }
        ListAttendance(
            request,
            response
        );
    }

    public void ListAttendance(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        try {
            TrainingScheduleDAO tdao = new TrainingScheduleDAO();
            List<TrainingSchedule> list = tdao.getAll();
            request.getSession().setAttribute(
                "sessionlist",
                list
            );
            response.sendRedirect("COACH/Attendance.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateAttendance(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        AttendanceDAO aDAO = new AttendanceDAO();
        PlayerDAO pDAO = new PlayerDAO();
        String[] playerID = request.getParameterValues("check");
        int TrainingID = Integer.parseInt(request.getParameter("cid"));
        List<Attendance> listAtten = aDAO.getAttendance(TrainingID);
        for (Attendance a : listAtten) {
            a.setIsPresent(false);
        }
        if (playerID != null) {
            for (Attendance a : listAtten) {
                for (String pID : playerID) {
                    if (a.getPlayerID() == Integer.parseInt(pID)) {
                        a.setIsPresent(true);
                    }
                }
            }
        }
        for (Attendance attendance : listAtten) {
            aDAO.update(attendance);
        }
        ListAttendance(
            request,
            response
        );
    }

    private void StatisticsAttendance(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws ServletException, IOException {
        try {
            AttendanceDAO attendanceDao = new AttendanceDAO();
            PlayerDAO playerDao = new PlayerDAO();
            UserDAO userDao = new UserDAO();
            TrainingScheduleDAO trainingScheduleDao = new TrainingScheduleDAO();

            Map<Integer, Map<Integer, Boolean>> attendanceData = attendanceDao.getAttendanceData();
            Set<Integer> trainingIds = attendanceDao.getAllTrainingIds();
            Map<Integer, Player> players = playerDao.getAllPlayers();
            Map<Integer, String> userImages = userDao.getAllUserImages();
            Map<Integer, LocalDate> trainingDates = trainingScheduleDao.getTrainingDates();

            // Ensure attendanceData includes entries for all players and all training sessions
            for (Integer playerId : players.keySet()) {
                attendanceData.putIfAbsent(
                    playerId,
                    new HashMap<>()
                );
                Map<Integer, Boolean> playerAttendance = attendanceData.get(playerId);
                for (Integer trainingId : trainingIds) {
                    playerAttendance.putIfAbsent(
                        trainingId,
                        null
                    ); // null means no data
                }
            }

            request.setAttribute(
                "attendanceData",
                attendanceData
            );
            request.setAttribute(
                "trainingIds",
                trainingIds
            );
            request.setAttribute(
                "players",
                players
            );
            request.setAttribute(
                "userImages",
                userImages
            );
            request.setAttribute(
                "trainingDates",
                trainingDates
            );

            request.getRequestDispatcher("COACH/StatisticsAttendance.jsp").forward(
                request,
                response
            );
        } catch (Exception e) {
            Logger.getLogger(this.getClass().getName()).log(
                Level.SEVERE,
                "Error in StatisticsAttendance",
                e
            );
            response.sendRedirect("error.jsp");
        }
    }

}
