/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.NewsDAO;
import Model.News;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Desktop
 */
public class NewsController extends HttpServlet {

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
            out.println("<title>Servlet NewsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewsController at " + request.getContextPath() + "</h1>");
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
                    ListNews(
                        request,
                        response
                    );
                    break;
                case "ADD":

                    break;
                case "LOAD":

                    break;
                case "UPDATE":

                    break;
                case "DELETE":
                    DeleteNews(
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
            NewsDAO ndao = new NewsDAO();
            String search = request.getParameter("search");

            List<News> listNews = null;
            listNews = ndao.getNewsBySearch(search);

            //            if (search != null && search != "") {
            //                listNews = ndao.getAll();
            //
            //            } else {
            //                listNews = ndao.getNewsBySearch(search);
            //            }

            Gson gson = new Gson();
            String json = gson.toJson(listNews);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            response.getWriter().flush();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void ListNews(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws IOException {
        response.sendRedirect("/SWPClubManegement/ADMIN/adminNewsList.jsp");
    }

    public void DeleteNews(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws IOException {
        try {

            int nid = Integer.parseInt(request.getParameter("nid"));

            NewsDAO ndao = new NewsDAO();
            ndao.delete(nid);


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
