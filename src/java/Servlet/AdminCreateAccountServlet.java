/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import DAO.UserDAO;
import Email.Email;
import Model.Role;
import Model.User;
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
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * @author Desktop
 */
public class AdminCreateAccountServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminCreateAccountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminCreateAccountServlet at " + request.getContextPath() + "</h1>");
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
        String file_name = null;

        String username = null;

        String email = null;
        String password = null;
        String roleString = null;

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

                        String path = request.getServletContext().getRealPath("IMAGE\\AVATAR");
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

            username = formFields.get("name");

            email = formFields.get("email");
            password = formFields.get("password");
            roleString = formFields.get("role");

            Role role = Role.valueOf(roleString);
            UserDAO udao = new UserDAO();
            User u = new User();
            u.setUserName(username);
            u.setPassword(password);
            u.setRole(role);
            u.setEmail(email);
            u.setStatus(true);
            if (file_name != null) {
                u.setImage("/SWPClubManegement/IMAGE/AVATAR/" + file_name);
            }

            if (udao.saveBool(u)) {
                String tieude = "Welcome to Realclub Wedsite " + username;
                String noidung = "This is your account for " + role + "\n" + "Email: " + email + "\n Password: " + password;
                Email.sendEmail(
                    email,
                    tieude,
                    noidung
                );
            } else {
                SendErrorMessage(
                    out,
                    "Email already existed"
                );

            }
            Gson gson = new Gson();

            out.print(gson.toJson("success"));
            out.flush();

        } catch (Exception e) {

            out.println("Error: " + e.getMessage());
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
