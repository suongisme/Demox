/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.UserDAO;
import Model.User;
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
public class EditProfileServlet extends HttpServlet {

    public static void handleUpload(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws IOException, ServletException {
        String file_name = null;
        String uid = null;
        String username = null;
        String fullname = null;
        String birthday = null;
        String about = null;
        String avatar = null;
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
        if (!isMultipartContent) {
            out.println("Error: Không chứa dữ liệu đa phần (enctype=multipart/form-data)");
            return;
        }
        FileItemFactory factory = new DiskFileItemFactory(); // Tạo factory chi dinh cach thuc de luu tru file dc tai len
        ServletFileUpload upload = new ServletFileUpload(factory); // serveletFileUpload xử lý các cái yêu cầu từ http
        //ServletFileUpload(factory) se tạo cac fileItem tu factory
        try {       // FileItem đại diện cho mỗi phần được tải lên( file , form-fields)
            List<FileItem> fields = upload.parseRequest(request);  // phan tich cac yeu cau va tra ve 1 fileItem
            Iterator<FileItem> it = fields.iterator();

            if (!it.hasNext()) {
                out.println("Error: Không có FileItem nào");
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
                            request.getSession().setAttribute(
                                "errorMessage",
                                "Only upload image"
                            );
                            response.sendRedirect("P/editPage.jsp");

                            return;

                        }
                        //fileItem .getName() tra ve 1 tẹp tin day du   file. get nen thi chi tra ve namefile
                        file_name = new File(fileItem.getName()).getName();

                        String path = request.getServletContext().getRealPath("IMAGE\\AVATAR");
                        String filePath = path + "\\" + file_name;

                        //                        String filePath = "SWPWedRealClubManagement\\web\\IMAGE/AVATAR\\" + file_name;
                        // Đảm bảo thư mục tồn tại
                        File directory = new File(filePath).getParentFile();
                        if (!directory.exists()) {
                            directory.mkdirs(); // tao cac thu muc cha can thiet;
                        }

                        fileItem.write(new File(filePath));
                        out.println("File đã được tải lên thành công: " + file_name);
                    }
                }
            }
            uid = formFields.get("uid");
            username = formFields.get("username");
            fullname = formFields.get("fullname");
            birthday = formFields.get("birthday");
            about = formFields.get("about");
            avatar = formFields.get("avatar");
            UserDAO udao = new UserDAO();
            User u = udao.get(Integer.parseInt(uid)).get();

            if (birthday != null && birthday != "") {

                LocalDate dateOfBirth = LocalDate.parse(birthday);

                u.setDateOfBirth(dateOfBirth);
            }
            u.setUserName(username);
            u.setName(fullname);
            if (file_name != null) {
                u.setImage("http://localhost:8080/SWPClubManegement/IMAGE/AVATAR/" + file_name);
            }
            u.setAbout(about);

            udao.update(u);
            request.getSession().setAttribute(
                "user",
                u
            );
            request.getSession().removeAttribute("errorMessage");
        } catch (Exception e) {

            out.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
        response.sendRedirect("P/editPage.jsp");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

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
            out.println("<title>Servlet EditProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProfileServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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

        response.sendRedirect("P/editPage.jsp");
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

        handleUpload(
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
