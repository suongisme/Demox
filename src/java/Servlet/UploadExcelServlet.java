/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import DAO.PlayerDAO;
import DAO.UserDAO;
import Model.Player;
import Model.Position;
import Model.Role;
import Model.User;
import org.apache.poi.ss.usermodel.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * @author Desktop
 */
@MultipartConfig
public class UploadExcelServlet extends HttpServlet {

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
            out.println("<title>Servlet UploadExcelServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadExcelServlet at " + request.getContextPath() + "</h1>");
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
        request.getSession().removeAttribute("emailValid");
        request.getSession().removeAttribute("status");

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
        response.setContentType("text/html;charset=UTF-8");

        // Get the file part from the request
        try {
            UserDAO udao = new UserDAO();
            PlayerDAO pdao = new PlayerDAO();
            Part filePart = request.getPart("file"); // "file" là tên của trường đầu vào trong biểu mẫu
            InputStream fileContent = filePart.getInputStream();
            Workbook workbook = WorkbookFactory.create(fileContent);
            Sheet sheet = workbook.getSheetAt(0); // Lấy sheet đầu tiên
            List<String> emailValid = new ArrayList<>();

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
            List<Player> players = new ArrayList<>();

            Map<String, Integer> columnIndices = new HashMap<>();

            // Xử lý hàng tiêu đề để điền vào bản đồ chỉ số cột
            Row rowHeader = sheet.getRow(0);
            for (Cell cell : rowHeader) {
                columnIndices.put(
                    cell.getStringCellValue().toLowerCase(),
                    cell.getColumnIndex()
                );
                System.out.println(columnIndices.get(cell.getStringCellValue().toLowerCase()));
            }

            // Duyệt qua các hàng để đọc dữ liệu
            Iterator<Row> rowIterator = sheet.iterator();
            // Bỏ qua hàng tiêu đề
            rowIterator.next();
            int rowCount = 0;

            List<? extends PictureData> pictures = workbook.getAllPictures();
            while (rowIterator.hasNext()) {

                Row row = rowIterator.next();
                if (row.getCell(0) == null) {
                    System.out.println("break");
                    break;
                }
                // Lấy thông tin cơ bản
                String name = getStringCellValue(
                    row,
                    columnIndices.get("name")
                );
                System.out.println("name " + name);
                String password = getStringCellValue(
                    row,
                    columnIndices.get("password")
                );
                if ("".equals(password)) {
                    password = String.valueOf((int) getNumericCellValue(
                        row,
                        columnIndices.get("password")
                    ));
                }
                System.out.println("pass " + password);
                String email = getStringCellValue(
                    row,
                    columnIndices.get("email")
                );
                User uCheckvalid = udao.getUserByEmail(email);
                if (uCheckvalid == null) {
                    System.out.println(email);
                    String image = "";
                    if (rowCount <= pictures.size() - 1) {
                        image = SaveImagePlayer(
                            request,
                            pictures.get(rowCount),
                            name
                        );
                    }
                    // Tạo đối tượng User
                    User u = new User(
                        name,
                        image,
                        password,
                        email,
                        Role.Player
                    );
                    udao.save(u);


                    String poString = getStringCellValue(
                        row,
                        columnIndices.get("position")
                    ).toUpperCase();

                    Position position = null;
                    if (poString != null || poString != "") {
                        System.out.println("po " + poString);
                        position = Position.valueOf(poString);

                    }

                    // Lấy và kiểm tra ngày tháng năm sinh
                    LocalDate age = getDateCellValue(
                        row,
                        columnIndices.get("dob"),
                        formatter
                    );

                    // Lấy cân nặng và chiều cao
                    double weight = getNumericCellValue(
                        row,
                        columnIndices.get("weight")
                    );
                    int height = (int) getNumericCellValue(
                        row,
                        columnIndices.get("height")
                    );

                    // Tạo đối tượng Player
                    Player player = new Player(
                        udao.getUserByEmail(email).getUserId(),
                        position,
                        name,
                        age,
                        weight,
                        height
                    );

                    // Lưu vào cơ sở dữ liệu (giả sử udao và pdao đã được triển khai đúng cách)
                    pdao.save(player);
                    // Thêm player vào danh sách
                    players.add(player);

                } else {
                    emailValid.add(email);
                }

                // Lấy và kiểm tra vị trí
                rowCount++;

            }

            workbook.close();

            // In players ra console để debug
            for (Player player : players) {
                System.out.println(player);
            }
            if (emailValid.isEmpty()) {
                request.getSession().setAttribute(
                    "status",
                    "1"
                );
            } else {
                request.getSession().setAttribute(
                    "emailValid",
                    emailValid
                );
            }

            response.sendRedirect("/SWPClubManegement/ADMIN/adminPage.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
    // Helper method to safely retrieve string cell value

    private String getStringCellValue(
        Row row,
        Integer columnIndex
    ) {
        Cell cell = row.getCell(columnIndex);
        if (cell != null && cell.getCellType() == CellType.STRING) {
            return cell.getStringCellValue();
        }
        return ""; // Return empty string if cell is null or not a string
    }

    // Helper method to safely retrieve numeric cell value
    private double getNumericCellValue(
        Row row,
        Integer columnIndex
    ) {
        Cell cell = row.getCell(columnIndex);
        if (cell != null && cell.getCellType() == CellType.NUMERIC) {
            return cell.getNumericCellValue();
        }
        return 0.0; // Return 0.0 if cell is null or not numeric
    }

    // Helper method to safely retrieve date cell value
    private LocalDate getDateCellValue(
        Row row,
        Integer columnIndex,
        DateTimeFormatter formatter
    ) {
        Cell cell = row.getCell(columnIndex);
        if (cell != null) {
            if (cell.getCellType() == CellType.STRING) {
                return LocalDate.parse(
                    cell.getStringCellValue(),
                    formatter
                );
            } else if (cell.getCellType() == CellType.NUMERIC) {
                return cell.getLocalDateTimeCellValue().toLocalDate();
            }
        }
        return null; // Handle null or invalid date cell
    }

    private String SaveImagePlayer(
        HttpServletRequest request,
        PictureData pictureData,
        String name
    ) throws IOException {
        String path = request.getServletContext().getRealPath("IMAGE\\PLAYER");
        //        String imageFilePath = "C:\\Users\\Desktop\\Documents\\NetBeansProjects\\SWPClubManegement\\web\\IMAGE\\PLAYER";

        String ext = pictureData.suggestFileExtension();
        byte[] pictureBytes = pictureData.getData();

        // Tạo tên tệp dựa trên thời gian để tránh trùng lặp
        String fileName = name.replace(
            " ",
            "_"
        ) + System.currentTimeMillis() + "." + ext;

        // Đường dẫn đầy đủ đến tệp đầu ra
        String outputFilePath = path + File.separator + fileName;
        String pa = request.getContextPath() + "\\IMAGE\\PLAYER\\" + fileName;
        // Ghi dữ liệu hình ảnh ra tệp
        FileOutputStream fileOutputStream = new FileOutputStream(outputFilePath);
        fileOutputStream.write(pictureBytes);
        fileOutputStream.close();
        return pa;
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
