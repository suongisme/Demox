/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import DAO.JerseySizeDAO;
import DAO.OrderDAO;
import DAO.OrderJerseyDetailsDAO;
import Model.JerseySize;
import Model.JerseyTemp;
import Model.OrderJersey;
import Model.OrderJerseyDetails;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

public class JerseyPaymentServlet extends HttpServlet {

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
            out.println("<title>Servlet JerseyPaymentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet JerseyPaymentServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(
            request,
            response
        );
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
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        // Đọc dữ liệu từ request body
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }

        OrderDAO odao = new OrderDAO();
        JerseySizeDAO jsdao = new JerseySizeDAO();
        OrderJerseyDetailsDAO ojddao = new OrderJerseyDetailsDAO();
        // Chuyển đổi dữ liệu từ JSON thành mảng Java
        //        int uid = Integer.parseInt(request.getParameter("uid"));
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String total = request.getParameter("money");

        if (address == null || phone == null || total == null) {
            SendErrorMessage(
                out,
                "missing Information"
            );
        }

        OrderJersey order = new OrderJersey();
        if (total != null) {
            order.setOrderTotal(Float.parseFloat(total));
        }
        order.setAddress(address);
        order.setPhone(phone);
        order.setUserID(1);
        odao.save(order);
        Gson gson = new Gson();
        JerseyTemp[] dataArray = gson.fromJson(
            sb.toString(),
            JerseyTemp[].class
        );

        OrderJersey od = odao.getLatestOrderByUID(1).get();
        // Lặp qua mảng để lấy các giá trị và xử lý
        for (JerseyTemp item : dataArray) {
            int id = item.getId();
            JerseySize jsize = jsdao.getBySizeAndJerseyID(
                id,
                item.getSize().trim()
            ).orElse(null);
            if (jsize == null) {
                SendErrorMessage(
                    out,
                    "Jersey size not found for ID: " + id
                );
                return;
            }
            jsize.setJerseyQuantity(jsize.getJerseyQuantity() - item.getQuantity());
            int sizeId = jsize.getSizeID();
            OrderJerseyDetails orderDetails = new OrderJerseyDetails(
                od.getOrderID(),
                sizeId,
                id,
                item.getQuantity()
            );
            jsdao.update(jsize);
            ojddao.save(orderDetails);
        }
        request.getSession().removeAttribute("status");
        // Gửi phản hồi về client
        response.setContentType("application/json");
        response.getWriter().write(gson.toJson(dataArray));
        response.getWriter().flush();
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
