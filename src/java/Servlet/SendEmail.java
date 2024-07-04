/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import DAO.UserDAO;
import Email.Email;
import Email.OTP;
import Model.Role;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static java.lang.System.out;

/**
 * @author Zanis
 */
public class SendEmail extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            User user = new User();
            String email = request.getParameter("email");
            UserDAO udao = new UserDAO();
            if (udao.getUserByEmail(email) == null) {
                String userName = request.getParameter("name");
                String pass = request.getParameter("password");
                user.setUserName(userName);
                user.setEmail(email);
                user.setPassword(pass);
                user.setRole(Role.User);
                String otp = OTP.generateOTP(6);
                request.getSession().setAttribute(
                    "user",
                    user
                );
                request.getSession().setAttribute(
                    "otp",
                    otp
                );
                String tieude = "Verify Account";
                String noidung = "Enter " + otp + " to verify your account.";
                Email.sendEmail(
                    email,
                    tieude,
                    noidung
                );
                response.sendRedirect("HOME/verify.jsp");
            } else {
                request.getSession().setAttribute(
                    "error",
                    "The email is used. Please enter again"
                );
                response.sendRedirect("HOME/signUp.jsp");
            }
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
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet Verify</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Verify Succesfuly</h1>");
        out.println("<h2>Hello8</h2>");
        out.println("</body>");
        out.println("</html>");
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
