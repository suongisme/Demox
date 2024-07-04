/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.TrainingScheduleDAO;
import Model.TrainingSchedule;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Zanis
 */
public class TrainingServlet extends HttpServlet {

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
            out.println("<title>Servlet TrainingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TrainingServlet at " + request.getContextPath() + "</h1>");
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
                    ListTraining(
                        request,
                        response
                    );
                    break;
                case "ADD":
                    AddTraining(
                        request,
                        response
                    );
                    break;
                case "UPDATE":
                    UpdateTraining(
                        request,
                        response
                    );
                    break;
                case "DELETE":
                    DeleteTraining(
                        request,
                        response
                    );
                    break;
                default:
                    ListTraining(
                        request,
                        response
                    );
            }

        } catch (Exception ex) {

            Logger.getLogger(TrainingServlet.class.getName()).log(
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

    public void ListTraining(
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
            response.sendRedirect("COACH/Training.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public void AddTraining(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        TrainingScheduleDAO tDAO = new TrainingScheduleDAO();
        LocalDate TrainingDate = LocalDate.parse(request.getParameter("trainingDate"));
        String TrainingTime = request.getParameter("trainingTime");
        String Location = request.getParameter("location");
        String Description = request.getParameter("description");
        TrainingSchedule t = new TrainingSchedule(
            TrainingDate,
            TrainingTime,
            Location,
            Description
        );
        tDAO.save(t);

        ListTraining(
            request,
            response
        );
    }

    private void DeleteTraining(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        int cid = Integer.parseInt(request.getParameter("cid"));
        new TrainingScheduleDAO().delete(cid);
        ListTraining(
            request,
            response
        );
    }

    private void UpdateTraining(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        int cid = Integer.parseInt(request.getParameter("cid"));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        TrainingScheduleDAO tDAO = new TrainingScheduleDAO();
        LocalDate TrainingDate = LocalDate.parse(request.getParameter("trainingDate"));
        String TrainingTime = request.getParameter("trainingTime");
        String Location = request.getParameter("location");
        String Description = request.getParameter("description");
        TrainingSchedule t = tDAO.get(cid).get();
        t.setTrainingDate(TrainingDate);
        t.setTrainingTime(TrainingTime);
        t.setLocation(Location);
        t.setDescription(Description);
        tDAO.update(t);
        ListTraining(
            request,
            response
        );
    }

}
