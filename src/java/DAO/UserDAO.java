/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Role;
import Model.User;
import dal.ConnectDB;

import java.sql.Date;
import java.sql.*;
import java.text.ParseException;
import java.time.LocalDate;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Desktop
 */
public class UserDAO extends ConnectDB implements DAO<User> {

    private String sql;
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    @Override
    public List<User> getAll() {
        try {
            List<User> users = new ArrayList<>();
            sql = "SELECT TOP (1000) [UserID]\n" + "      ,[Username]\n" + "      ,[Password]\n" + "      ,[Image]\n" + "      ,[Email]\n" + "      ,[Role]\n" + "      ,[Name]\n" + "       ,[DateOfBirth]\n" + "       ,[About]" + "          , [Status]" + "  FROM [RealClub].[dbo].[User]";
            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
            st = con.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("UserID"));
                u.setUserName(rs.getString("Username"));
                u.setPassword(rs.getString("Password"));
                u.setEmail(rs.getString("Email"));
                String image = rs.getString("Image");
                if (image != null) {
                    u.setImage(image.trim());

                }

                u.setRole(Role.valueOf(rs.getString("Role")));
                String name = rs.getString("Name");
                if (name != null) {
                    u.setName(name.trim());

                }
                Date sqlDate = rs.getDate("DateOfBirth");
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    u.setDateOfBirth(localDate);
                }
                u.setAbout(rs.getString("About"));
                u.setStatus(rs.getBoolean("Status"));
                users.add(u);
            }
            return users;
        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public List<User> getListSearchAccount(String searchTerm) {
        try {
            String searchValue = "%" + searchTerm + "%";
            List<User> users = new ArrayList<>();
            sql = "SELECT \n" + "      [UserID]\n" + "      ,[Username]\n" + "      ,[Password]\n" + "      ,[Image]\n" + "      ,[Email]\n" + "      ,[Role]\n" + "      ,[Name]\n" + "      ,[DateOfBirth]\n" + "      ,[About]\n" + "      ,[Status]\n" + "  FROM [RealClub].[dbo].[User]\n" + "  WHERE [Username] LIKE ?\n" + "     OR [Email] LIKE ?\n" + "     OR [Role] LIKE ?\n" + "     OR [Name] LIKE ?\n"

                + "     OR [Status] LIKE ?" + "     OR [UserID] LIKE ?;";
            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
            st = con.prepareStatement(sql);
            for (int i = 1; i <= 6; i++) {
                st.setString(
                    i,
                    searchValue
                );
            }
            rs = st.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("UserID"));
                u.setUserName(rs.getString("Username"));
                u.setPassword(rs.getString("Password"));
                u.setEmail(rs.getString("Email"));
                String image = rs.getString("Image");
                if (image != null) {
                    u.setImage(image.trim());

                }

                u.setRole(Role.valueOf(rs.getString("Role")));
                String name = rs.getString("Name");
                if (name != null) {
                    u.setName(name.trim());

                }
                Date sqlDate = rs.getDate("DateOfBirth");
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    u.setDateOfBirth(localDate);
                }
                u.setAbout(rs.getString("About"));
                u.setStatus(rs.getBoolean("Status"));
                users.add(u);
            }
            return users;
        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public List<User> getListUserUnknow(String role) {
        try {
            List<User> users = new ArrayList<>();

            sql = "SELECT u.* \n" + "FROM [User] u\n" + "LEFT JOIN [" + role + "] p ON u.UserID = p.UserID\n" + "WHERE u.role ='" + role + "' AND p.UserID IS NULL;";
            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
            st = con.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("UserID"));
                u.setUserName(rs.getString("Username"));
                u.setPassword(rs.getString("Password"));
                u.setEmail(rs.getString("Email"));
                String image = rs.getString("Image");
                if (image != null) {
                    u.setImage(image.trim());

                }

                u.setRole(Role.valueOf(rs.getString("Role")));
                String name = rs.getString("Name");
                if (name != null) {
                    u.setName(name.trim());

                }
                Date sqlDate = rs.getDate("DateOfBirth");
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    u.setDateOfBirth(localDate);
                }
                u.setAbout(rs.getString("About"));
                u.setStatus(rs.getBoolean("Status"));

                users.add(u);
            }
            return users;
        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public User login(
        String email,
        String password
    ) {
        User u = new User();

        String sql = "SELECT TOP (1000) [UserID]\n" + "      ,[Username]\n" + "      ,[Password]\n" + "      ,[Image]\n" + "      ,[Email]\n" + "      ,[Role]\n" + "      ,[Name]\n" + "       ,[DateOfBirth]\n" + "       ,[About]" + "          , [Status]" + "FROM [RealClub].[dbo].[User] WHERE [Email] = ? AND [Password] = ?";

        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setString(
                1,
                email
            );
            st.setString(
                2,
                password
            );
            rs = st.executeQuery();

            if (rs.next()) {

                u.setUserId(rs.getInt("UserID"));
                u.setUserName(rs.getString("Username"));
                u.setPassword(rs.getString("Password"));
                u.setEmail(rs.getString("Email"));
                String image = rs.getString("Image");
                if (image != null) {
                    u.setImage(image.trim());

                }

                u.setRole(Role.valueOf(rs.getString("Role")));
                String name = rs.getString("Name");
                if (name != null) {
                    u.setName(name.trim());

                }
                Date sqlDate = rs.getDate("DateOfBirth");
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    u.setDateOfBirth(localDate);
                }
                u.setAbout(rs.getString("About"));
                u.setStatus(rs.getBoolean("Status"));
                return u;
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(UserDAO.class.getName()).log(
                Level.SEVERE,
                null,
                e
            );
        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return null;
    }

    public User getUserByEmail(String email) {
        try {

            sql = " SELECT TOP (1000) [UserID]\n" + "      ,[Username]\n" + "      ,[Password]\n" + "      ,[Image]\n" + "      ,[Email]\n" + "      ,[Role]\n" + "      ,[Name]\n" + "       ,[DateOfBirth]\n" + "       ,[About]" + "          , [Status]" + "  FROM [RealClub].[dbo].[User] where Email = ?";
            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
            st = con.prepareStatement(sql);
            st.setString(
                1,
                email
            );
            rs = st.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("UserID"));
                u.setUserName(rs.getString("Username"));
                u.setPassword(rs.getString("Password"));
                u.setEmail(rs.getString("Email"));
                String image = rs.getString("Image");
                if (image != null) {
                    u.setImage(image.trim());

                }

                u.setRole(Role.valueOf(rs.getString("Role")));
                String name = rs.getString("Name");
                if (name != null) {
                    u.setName(name.trim());

                }
                Date sqlDate = rs.getDate("DateOfBirth");
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    u.setDateOfBirth(localDate);
                }
                u.setAbout(rs.getString("About"));
                u.setStatus(rs.getBoolean("Status"));
                return u;
            } else {

            }
        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public Optional<User> get(int id) {
        try {

            sql = " SELECT TOP (1000) [UserID]\n" + "      ,[Username]\n" + "      ,[Password]\n" + "      ,[Image]\n" + "      ,[Email]\n" + "      ,[Role]\n" + "      ,[Name]\n" + "       ,[DateOfBirth]\n" + "       ,[About]" + "          , [Status]" + "  FROM [RealClub].[dbo].[User] where UserID = ?";
            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                id
            );
            rs = st.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("UserID"));
                u.setUserName(rs.getString("Username"));
                u.setPassword(rs.getString("Password"));
                u.setEmail(rs.getString("Email"));
                String image = rs.getString("Image");
                if (image != null) {
                    u.setImage(image.trim());

                }

                u.setRole(Role.valueOf(rs.getString("Role")));
                String name = rs.getString("Name");
                if (name != null) {
                    u.setName(name.trim());

                }
                Date sqlDate = rs.getDate("DateOfBirth");
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    u.setDateOfBirth(localDate);
                }
                u.setAbout(rs.getString("About"));
                u.setStatus(rs.getBoolean("Status"));
                return Optional.of(u);
            } else {

            }
        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return Optional.empty();
    }

    @Override
    public void save(User t) {
        try {

            sql = "INSERT INTO [dbo].[User]\n" + "           ([Username]\n" + "           ,[Password]\n" + "           ,[Image]\n" + "           ,[Email]\n" + "           ,[Role]\n" + "           ,[Name]\n" + "           ,[DateOfBirth]\n" + "             ,[About]" + "          , [Status])" + "     VALUES(?,?,?,?,?,?,?,?,?)";

            con = openConnection();
            st = con.prepareStatement(sql);
            st.setString(
                1,
                t.getUserName()
            );
            st.setString(
                2,
                t.getPassword()
            );
            st.setString(
                3,
                t.getImage()
            );
            st.setString(
                4,
                t.getEmail()
            );
            st.setString(
                5,
                t.getRole().toString()
            );
            st.setString(
                6,
                t.getName()
            );
            if (t.getDateOfBirth() != null) {
                st.setDate(
                    7,
                    java.sql.Date.valueOf(t.getDateOfBirth())
                );
            } else {
                st.setDate(
                    7,
                    null
                );
            }
            st.setString(
                8,
                t.getAbout()
            );
            st.setBoolean(
                9,
                t.getStatus()
            );
            int rowsAffected = st.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("That bai");
            } else {
                System.out.println("Thanh cong");
            }
        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(
                Level.SEVERE,
                null,
                ex
            );
        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public Boolean saveBool(User t) {
        try {

            sql = "INSERT INTO [dbo].[User]\n" + "           ([Username]\n" + "           ,[Password]\n" + "           ,[Image]\n" + "           ,[Email]\n" + "           ,[Role]\n" + "           ,[Name]\n" + "           ,[DateOfBirth]\n" + "             ,[About]" + "          , [Status])" + "     VALUES(?,?,?,?,?,?,?,?,?)";

            con = openConnection();
            st = con.prepareStatement(sql);
            st.setString(
                1,
                t.getUserName()
            );
            st.setString(
                2,
                t.getPassword()
            );
            st.setString(
                3,
                t.getImage()
            );
            st.setString(
                4,
                t.getEmail()
            );
            st.setString(
                5,
                t.getRole().toString()
            );
            st.setString(
                6,
                t.getName()
            );
            if (t.getDateOfBirth() != null) {
                st.setDate(
                    7,
                    java.sql.Date.valueOf(t.getDateOfBirth())
                );
            } else {
                st.setDate(
                    7,
                    null
                );
            }
            st.setString(
                8,
                t.getAbout()
            );
            st.setBoolean(
                9,
                t.getStatus()
            );
            int rowsAffected = st.executeUpdate();
            return rowsAffected != 0;
        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(
                Level.SEVERE,
                null,
                ex
            );
        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public void update(User t) {
        try {

            sql = "UPDATE [dbo].[User]\n" + "   SET [Username] = ?\n" + "      ,[Password] = ?\n" + "      ,[Image] = ?\n" + "      ,[Email] = ?\n" + "      ,[Role] = ?," + "       [Name] = ?,\n" + "       [DateOfBirth] = ?\n" + "       ,[About]=?" + "          , [Status]=?" + " WHERE [UserID] = ?";
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setString(
                1,
                t.getUserName()
            );
            st.setString(
                2,
                t.getPassword()
            );
            st.setString(
                3,
                t.getImage()
            );
            st.setString(
                4,
                t.getEmail()
            );
            st.setString(
                5,
                t.getRole().toString()
            );
            st.setString(
                6,
                t.getName()
            );
            if (t.getDateOfBirth() != null) {
                st.setDate(
                    7,
                    java.sql.Date.valueOf(t.getDateOfBirth())
                );
            } else {
                st.setDate(
                    7,
                    null
                );
            }
            st.setString(
                8,
                t.getAbout()
            );
            st.setBoolean(
                9,
                t.getStatus()
            );

            st.setInt(
                10,
                t.getUserId()
            );
            int rowsAffected = st.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("That bai");
            } else {
                System.out.println("Thanh cong");
            }

        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(
                Level.SEVERE,
                null,
                ex
            );
        } finally {

            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void editProfile(User t) throws ParseException {
        try {

            sql = "UPDATE [dbo].[User]\n" + "   SET [Username] = ?\n" + "      ,[Password] = ?\n" + "      ,[Image] = ?\n" + "      ,[Email] = ?\n" + "      ,[Role] = ?," + "       [Name] = ?,\n" + "       [DateOfBirth] = ?\n" + "       [About]=?" + " WHERE [UserID] = ?";
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setString(
                1,
                t.getUserName()
            );
            st.setString(
                2,
                t.getPassword()
            );
            st.setString(
                3,
                t.getImage()
            );
            st.setString(
                4,
                t.getEmail()
            );
            st.setString(
                5,
                t.getRole().toString()
            );
            st.setString(
                6,
                t.getName()
            );
            if (t.getDateOfBirth() != null) {
                st.setDate(
                    7,
                    java.sql.Date.valueOf(t.getDateOfBirth())
                );
            } else {
                st.setDate(
                    7,
                    null
                );
            }
            st.setString(
                8,
                t.getAbout()
            );
            st.setInt(
                9,
                t.getUserId()
            );
            int rowsAffected = st.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("That bai");
            } else {
                System.out.println("Thanh cong");
            }

        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(
                Level.SEVERE,
                null,
                ex
            );
        } finally {

            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void delete(int id) {
        try {
            sql = " DELETE FROM [dbo].[User]\n" + "      WHERE [UserID] = ? \n";
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                id
            );
            int rowsAffected = st.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("That bai");
            } else {
                System.out.println("Thanh cong");
            }

        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(
                Level.SEVERE,
                null,
                ex
            );
        } finally {

            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public Map<Integer, String> getAllUserImages() {
        Map<Integer, String> userImages = new HashMap<>();
        sql = "SELECT UserID, Image FROM [RealClub].[dbo].[User]";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("UserID");
                String image = rs.getString("Image");
                if (image != null) {
                    userImages.put(
                        userId,
                        image.trim()
                    );
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(UserDAO.class.getName()).log(
                Level.SEVERE,
                "Error getting user images",
                e
            );
        } finally {
            closeResources();
        }
        return userImages;
    }

    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
