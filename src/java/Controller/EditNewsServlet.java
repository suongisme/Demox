/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.NewsDAO;
import Model.News;
import com.google.gson.Gson;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * @author Desktop
 */
public class EditNewsServlet extends HttpServlet {

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
            out.println("<title>Servlet EditNewsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditNewsServlet at " + request.getContextPath() + "</h1>");
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
        editNews(
            request,
            response
        );

    }

    public void ListNews(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        try {
            NewsDAO ndao = new NewsDAO();
            List<News> listNews = ndao.getAll();
            request.getSession().setAttribute(
                "listNews",
                listNews
            );

            response.sendRedirect("ADMIN/adminNewsList.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    public void editNews(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws IOException {

        String newsTitle = null;
        String newsImage = null;
        String newsContent = null;
        String file_name = null;
        String description = null;
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
        if (!isMultipartContent) {

            SendErrorMessage(
                out,
                "  Không chứa dữ liệu đa phần (enctype=multipart/form-data)"
            );

            return;
        }
        FileItemFactory factory = new DiskFileItemFactory(); // Tạo factory chi dinh cach thuc de luu tru file dc tai len
        ServletFileUpload upload = new ServletFileUpload(factory); // serveletFileUpload xử lý các cái yêu cầu từ http
        //ServletFileUpload(factory) se tạo cac fileItem tu factory
        try {       // FileItem đại diện cho mỗi phần được tải lên( file , form-fields)
            List<FileItem> fields = upload.parseRequest(request);  // phan tich cac yeu cau va tra ve 1 fileItem
            Iterator<FileItem> it = fields.iterator();

            if (!it.hasNext()) {
                SendErrorMessage(
                    out,
                    "  Không có FileItem nào"
                );

                return;
            }
            Map<String, String> formFields = new HashMap<>();
            while (it.hasNext()) {
                FileItem fileItem = it.next();
                if (fileItem.isFormField()) {
                    String fieldName = fileItem.getFieldName();
                    String value = fileItem.getString("UTF-8");
                    formFields.put(
                        fieldName,
                        value
                    );
                } else {
                    if (fileItem.getSize() > 0) {
                        String mimeType = fileItem.getContentType(); // get MINE (imgae/ png , image / jpg , application/ pdf)
                        if (mimeType == null || !mimeType.startsWith("image/")) {

                            SendErrorMessage(
                                out,
                                "  Only upload image"
                            );

                            return;

                        }
                        //fileItem .getName() tra ve 1 tẹp tin day du   file. get nen thi chi tra ve namefile
                        file_name = new File(fileItem.getName()).getName();

                        String path = request.getServletContext().getRealPath("IMAGE\\NEWS");
                        String filePath = path + "\\" + file_name;

                        //                        String filePath = "SWPWedRealClubManagement\\web\\IMAGE/AVATAR\\" + file_name;
                        // Đảm bảo thư mục tồn tại
                        File directory = new File(filePath).getParentFile();
                        if (!directory.exists()) {
                            directory.mkdirs(); // tao cac thu muc cha can thiet;
                        }

                        fileItem.write(new File(filePath));

                    }
                }
            }
            int nid = Integer.parseInt(formFields.get("nid"));
            newsTitle = formFields.get("newstitle1");
            newsImage = formFields.get("newsimage1");

            newsContent = formFields.get("content1");
            description = formFields.get("description1");
            NewsDAO ndao = new NewsDAO();
            News news = ndao.get(nid).get();
            news.setNewsTitle(newsTitle);
            if (file_name != null) {
                news.setNewsImageDescription(file_name);
            }
            news.setNewsContent(newsContent);
            news.setDatePosted(LocalDate.now());
            news.setDescription(description);
            ndao.update(news);
            Gson gson = new Gson();

            out.print(gson.toJson("success"));
            out.flush();

        } catch (Exception e) {

            out.println("Error: " + e.getMessage());
            e.printStackTrace();
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
