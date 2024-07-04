/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.UserDAO;
import Email.Email;
import Model.User;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Desktop
 */
public class BanAccountController extends HttpServlet {

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
            out.println("<title>Servlet BanAccountController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BanAccountController at " + request.getContextPath() + "</h1>");
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
                    ListAccounts(
                        request,
                        response
                    );
                    break;
                case "ADD":

                    break;
                case "SEND":
                    SendMessageBan(
                        request,
                        response
                    );
                    break;
                case "SEARCH":
                    SearchAccount(
                        request,
                        response
                    );
                    break;
                case "UPDATE":
                    UpdateStatus(
                        request,
                        response
                    );
                    break;
                case "DELETE":

                    break;
                default:

            }

        } catch (Exception ex) {

            ex.printStackTrace();
            // Ghi lại lỗi vào log
            log(
                "An error occurred in SearchAccount",
                ex
            );
            // Gửi phản hồi lỗi về cho client
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"error\": \"An error occurred.\"}");
            response.getWriter().flush();
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
        SearchAccount(
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

    public void SendMessageBan(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        if (request.getParameter("uid") != null) {
            String message = request.getParameter("message");
            if (message == null || message == "") {
                message = " đã mở khóa tài khoản";
            } else {
                message = "đã khóa tải khoản với lý do: " + message;
            }
            UserDAO udao = new UserDAO();
            int id = Integer.parseInt(request.getParameter("uid"));
            User u = udao.get(id).orElse(null);
            Email.sendEmail(
                u.getEmail(),
                "Ban your email at wedsite RealFC",
                "kính gửi tài khoản: " + u.getEmail() + " " + message
            );

        } else {
            SendErrorMessage(
                out,
                "Send email Fail"
            );
        }
        Gson gson = new Gson();

        out.print(gson.toJson("success"));
        out.flush();

    }

    public void ListAccounts(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        try {
            UserDAO udao = new UserDAO();
            List<User> accounts = udao.getAll();
            request.getSession().setAttribute(
                "listAccounts",
                accounts
            );

            response.sendRedirect("ADMIN/adminListAccounts.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void UpdateStatus(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        try {
            int uid = Integer.parseInt(request.getParameter("uid"));
            Boolean status = Boolean.parseBoolean(request.getParameter("status"));
            UserDAO udao = new UserDAO();
            User account = udao.get(uid).get();
            account.setStatus(status);
            udao.update(account);

            ListAccounts(
                request,
                response
            );

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void SearchAccount(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws IOException {
        try {
            String searchValue = request.getParameter("search");
            if (searchValue == null || searchValue.isEmpty()) {
                UserDAO udao = new UserDAO();

                List<User> accounts = udao.getAll();
                Gson gson = new Gson();
                String json = gson.toJson(accounts);

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                response.getWriter().flush();

            } else {
                UserDAO udao = new UserDAO();
                List<User> accounts = udao.getListSearchAccount(searchValue);

                // Convert the list of accounts to JSON
                Gson gson = new Gson();
                String json = gson.toJson(accounts);

                // Set content type and return JSON
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                response.getWriter().flush();
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Send the error as JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"error\": \"An error occurred.\"}");
            response.getWriter().flush();
        }
    }

    public void SendErrorMessage(
        PrintWriter out,
        String message
    ) {
        Map<String, String> errors = new HashMap<>();

        errors.put(
            "status",
            "error"
        );
        errors.put(
            "message",
            message
        );

        Gson gson = new Gson();

        out.print(gson.toJson(errors));
        out.flush();

    }
}
