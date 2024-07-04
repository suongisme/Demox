/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import DAO.JerseyDAO;
import Model.Jersey;
import com.google.gson.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Desktop
 */
public class ShopJerseyServlet extends HttpServlet {

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
            out.println("<title>Servlet ShopJerseyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopJerseyServlet at " + request.getContextPath() + "</h1>");
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

        response.sendRedirect("/SWPClubManegement/STORE/product.jsp");
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
            BufferedReader reader = request.getReader();
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
            String requestData = sb.toString();

            // Parse JSON data into List<String> of price ranges
            Gson gson = new Gson();

            JsonObject jsonObject = gson.fromJson(
                requestData,
                JsonObject.class
            );

            // Extract priceRanges and nameSearch from JSON object
            JsonArray priceRangesJsonArray = jsonObject.getAsJsonArray("priceRanges");

            // Convert priceRangesJsonArray to List<String>
            List<String> priceRanges = new ArrayList<>();
            for (JsonElement element : priceRangesJsonArray) {
                priceRanges.add(element.getAsString());
            }
            if (priceRanges.isEmpty()) {
                JerseyDAO jdao = new JerseyDAO();

            }
            String nameSearch = jsonObject.get("nameSearch").getAsString();

            int currentPage = jsonObject.get("currentPage").getAsInt();

            // Example: Search jerseys by price ranges and/or name
            List<Jersey> filteredJerseys = searchJerseysByPriceAndName(
                priceRanges,
                nameSearch
            );

            int totalItems = filteredJerseys.size();
            int itemsPerPage = 8; // Fixed items per page
            int fromIndex = (currentPage - 1) * itemsPerPage;
            int toIndex = Math.min(
                fromIndex + itemsPerPage,
                totalItems
            );
            List<Jersey> paginatedJerseys = filteredJerseys.subList(
                fromIndex,
                toIndex
            );
            // Convert filtered results to JSON and send response
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.add(
                "products",
                gson.toJsonTree(paginatedJerseys)
            );

            response.setContentType("application/json");
            response.getWriter().write(gson.toJson(jsonResponse));

        } catch (JsonSyntaxException | IOException e) {
            // Handle JSON syntax errors or other IO exceptions
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Error parsing JSON: " + e.getMessage());
        } catch (Exception e) {
            // Handle other unexpected exceptions
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Internal server error: " + e.getMessage());
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

    private List<Jersey> searchJerseysByPriceAndName(
        List<String> priceRanges,
        String nameSearch
    ) {
        JerseyDAO jdao = new JerseyDAO();
        List<Jersey> allJerseys = jdao.getAll();
        List<Jersey> filteredByPrice;
        // Filter by price ranges
        if (!priceRanges.isEmpty()) {
            filteredByPrice = allJerseys.stream().filter(jersey -> {
                for (String range : priceRanges) {
                    String[] limits = range.split("-");
                    double minPrice = Double.parseDouble(limits[0]);
                    double maxPrice = Double.parseDouble(limits[1]);
                    if (jersey.getJerseyPrice() >= minPrice && jersey.getJerseyPrice() <= maxPrice) {
                        return true;
                    }
                }
                return false;
            }).collect(Collectors.toList());

        } else {
            filteredByPrice = allJerseys;
        }
        // Filter by name if nameSearch is provided
        if (nameSearch != null && !nameSearch.isEmpty()) {

            String lowerCaseSearch = nameSearch.toLowerCase();
            filteredByPrice = filteredByPrice.stream().filter(jersey -> jersey.getJerseyName().toLowerCase()
                .contains(lowerCaseSearch)).collect(Collectors.toList());
        }

        return filteredByPrice;
    }
}
