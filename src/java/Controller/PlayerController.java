/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.PlayerDAO;
import DAO.UserDAO;
import Model.Player;
import Model.Position;
import Model.User;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
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
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Desktop
 */
public class PlayerController extends HttpServlet {

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
            out.println("<title>Servlet PlayerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PlayerController at " + request.getContextPath() + "</h1>");
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
                    response.sendRedirect("/SWPClubManegement/ADMIN/adminPage.jsp");
                    break;
                case "ADD":
                    AddPlayer(
                        request,
                        response
                    );
                    break;
                case "LOAD":
                    ListPlayers(
                        request,
                        response
                    );
                    break;
                case "UPDATE":
                    UpdatePlayer(
                        request,
                        response
                    );
                    break;
                case "DELETE":
                    DeletePlayer(
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
        UpdatePlayer(
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

    public void ListPlayers(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        try {
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
            PlayerDAO pdao = new PlayerDAO();
            UserDAO udao = new UserDAO();
            List<Player> players = pdao.getBySearch(search);

            List<String> positions = new ArrayList<>();
            List<User> users = new ArrayList<>();

            for (Player p : players) {
                User u = udao.get(p.getUserID()).orElse(null);
                users.add(u);
            }

            // Lặp qua tất cả các giá trị enum và thêm chúng vào danh sách
            Gson gson = new Gson();
            JsonObject json = new JsonObject();
            json.add(
                "players",
                gson.toJsonTree(players)
            );
            json.add(
                "users",
                gson.toJsonTree(users)
            );
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json.toString());
            response.getWriter().flush();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void AddPlayer(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        try {
            Player p = new Player();
            String playerName = request.getParameter("playerName");

            Position position = Position.valueOf(request.getParameter("position"));
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate age = LocalDate.parse(
                request.getParameter("dateOfBirth"),
                formatter
            );

            String formattedWeight = request.getParameter("weight");
            double weight = Double.parseDouble(formattedWeight);
            double roundedWeight = Math.round(weight * 10.0) / 10.0;

            int height = Integer.parseInt(request.getParameter("height"));
            if (request.getParameter("uid") != null) {
                int uid = Integer.parseInt(request.getParameter("uid"));
                p.setUserID(uid);
            }

            p.setHeight(height);
            p.setWeight(roundedWeight);
            p.setName(playerName);
            p.setPosition(position);
            p.setAge(age);

            PlayerDAO pdao = new PlayerDAO();
            UserDAO udao = new UserDAO();

            pdao.save(p);

            Gson gson = new Gson();
            String json = gson.toJson(udao.getListUserUnknow("Player"));

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            response.getWriter().flush();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void UpdatePlayer(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        try {

            String playerName = null;

            Position position = null;
            String file_name = null;
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate age = null;
            String formattedWeight = null;
            double weight;
            double roundedWeight;
            int height;
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
                            file_name = new File(fileItem.getName()).getName() + System.currentTimeMillis();

                            String path = request.getServletContext().getRealPath("IMAGE\\PLAYER");
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
                int pid = Integer.parseInt(formFields.get("pid"));
                playerName = formFields.get("playerName1");
                position = Position.valueOf(formFields.get("position1"));

                age = LocalDate.parse(
                    formFields.get("dateOfBirth1"),
                    formatter
                );
                formattedWeight = formFields.get("weight1");
                weight = Double.parseDouble(formattedWeight);
                roundedWeight = Math.round(weight * 10.0) / 10.0;

                height = Integer.parseInt(formFields.get("height1"));
                PlayerDAO pdao = new PlayerDAO();
                Player p = pdao.get(Integer.parseInt(formFields.get("pid"))).orElse(null);
                UserDAO udao = new UserDAO();
                User u = udao.getUserByEmail(formFields.get("email1"));
                if (file_name != null && u != null) {

                    u.setImage(request.getContextPath() + "\\IMAGE\\PLAYER\\" + file_name);
                    udao.update(u);
                }

                p.setHeight(height);
                p.setWeight(roundedWeight);
                p.setName(playerName);
                p.setPosition(position);
                p.setAge(age);

                pdao.update(p);
                Gson gson = new Gson();

                out.print(gson.toJson("success"));
                out.flush();

            } catch (Exception e) {

                out.println("Error: " + e.getMessage());
                e.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void DeletePlayer(
        HttpServletRequest request,
        HttpServletResponse response
    ) {
        try {
            String playerName = request.getParameter("playerName");

            int pid = Integer.parseInt(request.getParameter("pid"));
            Gson gson = new Gson();
            PlayerDAO pdao = new PlayerDAO();
            Player p = pdao.get(pid).orElse(null);
            if (pdao.deleteBool(pid)) {

                String json = gson.toJson(p);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                response.getWriter().flush();
            } else {
                String json = gson.toJson("fail");
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                response.getWriter().flush();
            }

        } catch (Exception e) {
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

}