/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.JerseyDAO;
import DAO.JerseySizeDAO;
import Model.Jersey;
import Model.JerseySize;
import Model.JerseySizeEnum;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * @author Zanis
 */
public class JerseyServlet extends HttpServlet {

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
            out.println("<title>Servlet JerseyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet JerseyServlet at " + request.getContextPath() + "</h1>");
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
                    ListJersey(
                        request,
                        response
                    );
                    break;
                case "ADD":
                    AddJersey(
                        request,
                        response
                    );
                    break;
                case "UPDATE":
                    UpdateJersey(
                        request,
                        response
                    );
                    break;
                case "DELETE":
                    DeleteJersey(
                        request,
                        response
                    );
                    break;
                default:
                    ListJersey(
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

    private void ListJersey(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        try {
            JerseyDAO jDAO = new JerseyDAO();
            JerseySizeDAO jSDAO = new JerseySizeDAO();
            List<Jersey> jerseys = jDAO.getAll();
            List<JerseySize> jerseySizes = jSDAO.getAll();
            request.getSession().setAttribute(
                "jerseys",
                jerseys
            );
            request.getSession().setAttribute(
                "jerseySizes",
                jerseySizes
            );
            response.sendRedirect("SALEMAN/listJersey.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void AddJersey(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        int newid = 0;
        JerseyDAO jDAO = new JerseyDAO();
        JerseySizeDAO jSDAO = new JerseySizeDAO();
        String JerseyName = request.getParameter("jerseyName");
        String description = request.getParameter("description");
        double JerseyPrice = Double.parseDouble((request.getParameter("jerseyPrice")));
        Jersey j = new Jersey(
            JerseyName,
            description,
            JerseyPrice,
            ""
        );
        jDAO.save(j);
        List<Jersey> jerseys = jDAO.getAll();
        List<JerseySize> jerseySizes = jSDAO.getAll();
        for (Jersey jersey : jerseys) {
            for (JerseySize jerseySize : jerseySizes) {
                if (jersey.getJerseyID() != jerseySize.getJerseyID()) {
                    newid = jersey.getJerseyID();
                    break;
                }
            }
        }
        JerseySize jsS = new JerseySize(
            newid,
            JerseySizeEnum.S,
            0
        );
        JerseySize jsM = new JerseySize(
            newid,
            JerseySizeEnum.M,
            0
        );
        JerseySize jsL = new JerseySize(
            newid,
            JerseySizeEnum.L,
            0
        );
        JerseySize jsXL = new JerseySize(
            newid,
            JerseySizeEnum.XL,
            0
        );
        JerseySize jsXXL = new JerseySize(
            newid,
            JerseySizeEnum.XXL,
            0
        );
        jSDAO.save(jsXXL);
        jSDAO.save(jsXL);
        jSDAO.save(jsL);
        jSDAO.save(jsM);
        jSDAO.save(jsS);
        ListJersey(
            request,
            response
        );
    }

    private void UpdateJersey(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        JerseyDAO jDAO = new JerseyDAO();
        JerseySizeDAO jSDAO = new JerseySizeDAO();
        int JerseyID = Integer.parseInt(request.getParameter("cid"));
        String JerseyName = request.getParameter("jerseyName");
        String description = request.getParameter("description");
        double JerseyPrice = Double.parseDouble((request.getParameter("jerseyPrice")));
        Jersey j = new Jersey(
            JerseyID,
            JerseyName,
            description,
            JerseyPrice,
            ""
        );
        jDAO.update(j);
        int SizeID = Integer.parseInt(request.getParameter("jid"));
        int JerseyQuantity = Integer.parseInt(request.getParameter("jerseyQuantity"));
        JerseySizeEnum Size = JerseySizeEnum.valueOf(request.getParameter("jerseySize"));
        JerseySize s = new JerseySize(
            SizeID,
            JerseyID,
            Size,
            JerseyQuantity
        );
        jSDAO.update(s);
        ListJersey(
            request,
            response
        );
    }

    private void DeleteJersey(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        int cid = Integer.parseInt(request.getParameter("cid"));
        new JerseySizeDAO().delete(cid);
        ListJersey(
            request,
            response
        );
    }

}
