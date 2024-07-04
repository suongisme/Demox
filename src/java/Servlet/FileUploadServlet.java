/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Desktop
 */
@MultipartConfig
public class FileUploadServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";
    private static final Logger LOGGER = Logger.getLogger(FileUploadServlet.class.getName());

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
            out.println("<title>Servlet FileUploadServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FileUploadServlet at " + request.getContextPath() + "</h1>");
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
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        // Create the directory if it doesn't exist
        File fileSaveDir = new File(uploadFilePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }

        String fileName = "";
        String fileUrl = "";

        try {
            for (Part part : request.getParts()) {
                fileName = getFileName(part);
                if (fileName != null && !fileName.isEmpty()) {
                    part.write(uploadFilePath + File.separator + fileName);
                    fileUrl = request.getContextPath() + "/" + UPLOAD_DIR + "/" + fileName;
                    // Break the loop after processing one part
                    break;
                }
            }

            // Check if fileUrl is created
            if (fileName.isEmpty() || fileUrl.isEmpty()) {
                LOGGER.log(
                    Level.SEVERE,
                    "File URL or fileName is missing."
                );
                out.print("{\"uploaded\": 0, \"error\": {\"message\": \"File URL or fileName is missing.\"}}");
            } else {
                // Return valid JSON response to CKEditor
                out.print("{\"uploaded\": 1, \"fileName\": \"" + fileName + "\", \"url\": \"" + fileUrl + "\"}");
            }
        } catch (Exception e) {
            LOGGER.log(
                Level.SEVERE,
                "File upload failed",
                e
            );
            out.print("{\"uploaded\": 0, \"error\": {\"message\": \"Cannot write uploaded file to disk.\"}}");
        }
        out.flush();
    }

    // Get file name from part
    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        if (contentDisposition != null) {
            String[] items = contentDisposition.split(";");
            for (String item : items) {
                if (item.trim().startsWith("filename")) {
                    String fileName = item.substring(
                        item.indexOf('=') + 2,
                        item.length() - 1
                    );
                    fileName = fileName.replace(
                        "\\",
                        "/"
                    );
                    int lastSlashIndex = fileName.lastIndexOf('/');
                    return fileName.substring(lastSlashIndex + 1);
                }
            }
        }
        return null;
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
