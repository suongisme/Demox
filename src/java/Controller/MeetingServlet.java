/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.MeetingDAO;
import Model.Meeting;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;

/**
 * @author Zanis
 */
public class MeetingServlet extends HttpServlet {

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
            out.println("<title>Servlet MeetingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MeetingServlet at " + request.getContextPath() + "</h1>");
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
                    ListMeeting(
                        request,
                        response
                    );
                    break;
                case "ADD":
                    AddMeeting(
                        request,
                        response
                    );
                    break;
                case "UPDATE":
                    UpdateMeeting(
                        request,
                        response
                    );
                    break;
                case "DELETE":
                    DeleteMeeting(
                        request,
                        response
                    );
                    break;
                default:
                    ListMeeting(
                        request,
                        response
                    );
            }

        } catch (Exception ex) {

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

    private void ListMeeting(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        try {
            MeetingDAO tdao = new MeetingDAO();
            List<Meeting> list = tdao.getAll();
            request.getSession().setAttribute(
                "sessionlist",
                list
            );
            response.sendRedirect("COACH/Meeting.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void AddMeeting(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        MeetingDAO tDAO = new MeetingDAO();
        LocalDate MeetingDate = LocalDate.parse(request.getParameter("meetingDate"));
        String MeetingTime = request.getParameter("meetingTime");
        String Location = request.getParameter("location");
        String Description = request.getParameter("description");
        Meeting t = new Meeting(
            MeetingDate,
            MeetingTime,
            Location,
            Description
        );
        tDAO.save(t);
        ListMeeting(
            request,
            response
        );
    }

    private void UpdateMeeting(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        MeetingDAO tDAO = new MeetingDAO();
        int MeetingID = Integer.parseInt(request.getParameter("cid"));
        LocalDate MeetingDate = LocalDate.parse(request.getParameter("meetingDate"));
        String MeetingTime = request.getParameter("meetingTime");
        String Location = request.getParameter("location");
        String Description = request.getParameter("description");
        Meeting t = new Meeting(
            MeetingID,
            MeetingDate,
            MeetingTime,
            Location,
            Description
        );
        tDAO.update(t);
        ListMeeting(
            request,
            response
        );
    }

    private void DeleteMeeting(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        int cid = Integer.parseInt(request.getParameter("cid"));
        new MeetingDAO().delete(cid);
        ListMeeting(
            request,
            response
        );
    }

}
