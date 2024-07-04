/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author Desktop
 */
public class FileBrowserServlet extends HttpServlet {

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
            out.println("<title>Servlet FileBrowserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FileBrowserServlet at " + request.getContextPath() + "</h1>");
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
        File uploadDir = new File(getServletContext().getRealPath("/uploads"));
        File[] files = uploadDir.listFiles();
        String contextPath = request.getContextPath();
        response.setContentType("text/html");
        response.getWriter()
            .print("<!DOCTYPE html><html lang='en'><head><meta charset='UTF-8'><title>File Browser</title><style>body { font-family: Arial, sans-serif; } .file-list { display: flex; flex-wrap: wrap; gap: 10px; } .file-item { list-style-type: none; } .file-item img { max-width: 150px; max-height: 150px; cursor: pointer; }</style><script>function selectFile(url) { window.opener.CKEDITOR.tools.callFunction(getUrlParam('CKEditorFuncNum'), url); window.close(); } function getUrlParam(paramName) { const reParam = new RegExp('(?:[?&]|&)' + paramName + '=([^&]+)', 'i'); const match = window.location.search.match(reParam); return (match && match.length > 1) ? match[1] : null; }</script></head><body><h1>Select a file</h1><ul class='file-list'>");

        if (files != null) {
            for (File file : files) {
                if (file.isFile()) {
                    String filePath = contextPath + "/uploads/" + file.getName();
                    response.getWriter()
                        .print("<li class='file-item'><img src='" + filePath + "' alt='" + file.getName() + "' onclick='selectFile(\"" + filePath + "\")'>" + "<p>" + file.getName() + "</p>" + "</li>");
                }
            }
        }

        response.getWriter().print("</ul></body></html>");
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
