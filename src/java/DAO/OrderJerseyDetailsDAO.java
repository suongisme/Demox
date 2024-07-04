/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.OrderJerseyDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Desktop
 */
public class OrderJerseyDetailsDAO extends dal.ConnectDB implements DAO<OrderJerseyDetails> {
    private String sql;
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    @Override
    public List<OrderJerseyDetails> getAll() {
        List<OrderJerseyDetails> orderJerseyDetailsList = new ArrayList<>();
        sql = "SELECT [OrderDetailID], [OrderID], [JerseySizeID], [JerseyID], [JerseyQuantity] " + "FROM [RealClub].[dbo].[OrderJerseyDetails]";
        try {
            con = openConnection(); // Mở kết nối đến cơ sở dữ liệu
            st = con.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                int orderDetailID = rs.getInt("OrderDetailID");
                int orderID = rs.getInt("OrderID");
                int jerseySizeID = rs.getInt("JerseySizeID");
                int jerseyID = rs.getInt("JerseyID");
                int jerseyQuantity = rs.getInt("JerseyQuantity");

                OrderJerseyDetails orderDetail = new OrderJerseyDetails(
                    orderDetailID,
                    orderID,
                    jerseySizeID,
                    jerseyID,
                    jerseyQuantity
                );
                orderJerseyDetailsList.add(orderDetail);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(OrderJerseyDetailsDAO.class.getName()).log(
                Level.SEVERE,
                null,
                e
            );
        } finally {
            closeResources();
        }
        return orderJerseyDetailsList;
    }

    @Override
    public Optional<OrderJerseyDetails> get(int id) {
        Optional<OrderJerseyDetails> result = Optional.empty();
        sql = "SELECT [OrderDetailID], [OrderID], [JerseySizeID], [JerseyID], [JerseyQuantity] " + "FROM [RealClub].[dbo].[OrderJerseyDetails] WHERE [OrderDetailID] = ?";
        try {
            con = openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                id
            );
            rs = st.executeQuery();

            if (rs.next()) {
                int orderDetailID = rs.getInt("OrderDetailID");
                int orderID = rs.getInt("OrderID");
                int jerseySizeID = rs.getInt("JerseySizeID");
                int jerseyID = rs.getInt("JerseyID");
                int jerseyQuantity = rs.getInt("JerseyQuantity");

                OrderJerseyDetails orderDetail = new OrderJerseyDetails(
                    orderDetailID,
                    orderID,
                    jerseySizeID,
                    jerseyID,
                    jerseyQuantity
                );
                result = Optional.of(orderDetail);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(OrderJerseyDetailsDAO.class.getName()).log(
                Level.SEVERE,
                null,
                e
            );
        } finally {
            closeResources();
        }
        return result;
    }

    @Override
    public void save(OrderJerseyDetails orderDetail) {
        sql = "INSERT INTO [RealClub].[dbo].[OrderJerseyDetails] ([OrderID], [JerseySizeID], [JerseyID], [JerseyQuantity]) " + "VALUES (?, ?, ?, ?)";
        try {
            con = openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                orderDetail.getOrderID()
            );
            st.setInt(
                2,
                orderDetail.getJerseySizeID()
            );
            st.setInt(
                3,
                orderDetail.getJerseyID()
            );
            st.setInt(
                4,
                orderDetail.getJerseyQuantity()
            );
            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(OrderJerseyDetailsDAO.class.getName()).log(
                Level.SEVERE,
                null,
                e
            );
        } finally {
            closeResources();
        }
    }

    @Override
    public void update(OrderJerseyDetails orderDetail) {
        sql = "UPDATE [RealClub].[dbo].[OrderJerseyDetails] " + "SET [OrderID] = ?, [JerseySizeID] = ?, [JerseyID] = ?, [JerseyQuantity] = ? WHERE [OrderDetailID] = ?";
        try {
            con = openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                orderDetail.getOrderID()
            );
            st.setInt(
                2,
                orderDetail.getJerseySizeID()
            );
            st.setInt(
                3,
                orderDetail.getJerseyID()
            );
            st.setInt(
                4,
                orderDetail.getJerseyQuantity()
            );
            st.setInt(
                5,
                orderDetail.getOrderDetailID()
            );
            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(OrderJerseyDetailsDAO.class.getName()).log(
                Level.SEVERE,
                null,
                e
            );
        } finally {
            closeResources();
        }
    }

    @Override
    public void delete(int id) {
        sql = "DELETE FROM [RealClub].[dbo].[OrderJerseyDetails] WHERE [OrderDetailID] = ?";
        try {
            con = openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                id
            );
            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(OrderJerseyDetailsDAO.class.getName()).log(
                Level.SEVERE,
                null,
                e
            );
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
            Logger.getLogger(OrderJerseyDetailsDAO.class.getName()).log(
                Level.SEVERE,
                null,
                e
            );
        }
    }

}
