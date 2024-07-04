/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.OrderJersey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Desktop
 */
public class OrderDAO extends dal.ConnectDB implements DAO<OrderJersey> {

    private String sql;
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    @Override
    public List<OrderJersey> getAll() {
        List<OrderJersey> orderList = new ArrayList<>();
        try {
            sql = "SELECT [OrderID], [UserID], [OrderDate], [OrderTotal], [Phone], [Address] " + "FROM [RealClub].[dbo].[Orders]";
            try {
                con = openConnection(); // Giả sử bạn đã có phương thức getConnection() để mở kết nối đến cơ sở dữ liệu
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
            st = con.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                int orderID = rs.getInt("OrderID");
                int userID = rs.getInt("UserID");
                LocalDate orderDate = rs.getDate("OrderDate")
                    .toLocalDate(); // Chuyển đổi từ java.sql.Date sang LocalDate
                double orderTotal = rs.getDouble("OrderTotal");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");

                OrderJersey order = new OrderJersey(
                    orderID,
                    userID,
                    orderDate,
                    orderTotal,
                    phone,
                    address
                );
                orderList.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng các tài nguyên
            closeResources();
        }
        return orderList;
    }

    public Optional<OrderJersey> getLatestOrderByUID(int id) {
        Optional<OrderJersey> result = Optional.empty();
        try {
            sql = "SELECT TOP 1 [OrderID], [UserID], [OrderDate], [OrderTotal], [Phone], [Address]\n" + "FROM [RealClub].[dbo].[Orders]\n" + "WHERE [UserID] = ?\n" + "ORDER BY [OrderDate] DESC, [OrderID] DESC ";
            con = openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                id
            );
            rs = st.executeQuery();

            if (rs.next()) {
                int orderID = rs.getInt("OrderID");
                int userID = rs.getInt("UserID");
                LocalDate orderDate = rs.getDate("OrderDate").toLocalDate();
                double orderTotal = rs.getDouble("OrderTotal");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");

                OrderJersey order = new OrderJersey(
                    orderID,
                    userID,
                    orderDate,
                    orderTotal,
                    phone,
                    address
                );
                result = Optional.of(order);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return result;
    }

    @Override
    public Optional<OrderJersey> get(int id) {
        Optional<OrderJersey> result = Optional.empty();
        try {
            sql = "SELECT [OrderID], [UserID], [OrderDate], [OrderTotal], [Phone], [Address] " + "FROM [RealClub].[dbo].[Orders] WHERE [OrderID] = ?";
            con = openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                id
            );
            rs = st.executeQuery();

            if (rs.next()) {
                int orderID = rs.getInt("OrderID");
                int userID = rs.getInt("UserID");
                LocalDate orderDate = rs.getDate("OrderDate").toLocalDate();
                double orderTotal = rs.getDouble("OrderTotal");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");

                OrderJersey order = new OrderJersey(
                    orderID,
                    userID,
                    orderDate,
                    orderTotal,
                    phone,
                    address
                );
                result = Optional.of(order);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return result;
    }

    @Override
    public void save(OrderJersey order) {
        try {
            sql = "INSERT INTO [RealClub].[dbo].[Orders] ([UserID], [OrderDate], [OrderTotal], [Phone], [Address]) " + "VALUES (?, ?, ?, ?, ?)";
            con = openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                order.getUserID()
            );
            st.setDate(
                2,
                java.sql.Date.valueOf(order.getOrderDate())
            );
            st.setDouble(
                3,
                order.getOrderTotal()
            );
            st.setString(
                4,
                order.getPhone()
            );
            st.setString(
                5,
                order.getAddress()
            );
            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }

    @Override
    public void update(OrderJersey order) {
        try {
            sql = "UPDATE [RealClub].[dbo].[Orders] SET [UserID] = ?, [OrderDate] = ?, [OrderTotal] = ?, " + "[Phone] = ?, [Address] = ? WHERE [OrderID] = ?";
            con = openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                order.getUserID()
            );
            st.setDate(
                2,
                java.sql.Date.valueOf(order.getOrderDate())
            );
            st.setDouble(
                3,
                order.getOrderTotal()
            );
            st.setString(
                4,
                order.getPhone()
            );
            st.setString(
                5,
                order.getAddress()
            );
            st.setInt(
                6,
                order.getOrderID()
            );
            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }

    @Override
    public void delete(int id) {
        try {
            sql = "DELETE FROM [RealClub].[dbo].[Orders] WHERE [OrderID] = ?";
            con = openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                id
            );
            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
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
