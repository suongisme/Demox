/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.JerseySize;
import Model.JerseySizeEnum;

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
public class JerseySizeDAO extends dal.ConnectDB implements DAO<JerseySize> {

    private String sql;
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;


    public List<JerseySize> getSizeByJerseyID(int id) {
        List<JerseySize> jerseySizeList = new ArrayList<>();
        try {
            sql = "SELECT [SizeID], [JerseyID], [JerseySize], [JerseyQuantity] " + "FROM [RealClub].[dbo].[JerseySizes] WHERE JerseyID = ? And [JerseyQuantity] >0 ";
            try {
                con = openConnection(); // Mở kết nối đến cơ sở dữ liệu
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(JerseySizeDAO.class.getName()).log(
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

            while (rs.next()) {
                int sizeID = rs.getInt("SizeID");
                int jerseyID = rs.getInt("JerseyID");
                JerseySizeEnum jerseySize = JerseySizeEnum.valueOf(rs.getString("JerseySize"));
                int jerseyQuantity = rs.getInt("JerseyQuantity");

                JerseySize size = new JerseySize(
                    sizeID,
                    jerseyID,
                    jerseySize,
                    jerseyQuantity
                );
                jerseySizeList.add(size);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return jerseySizeList;
    }

    @Override
    public List<JerseySize> getAll() {
        List<JerseySize> jerseySizeList = new ArrayList<>();
        try {
            sql = "SELECT [SizeID], [JerseyID], [JerseySize], [JerseyQuantity] " + "FROM [RealClub].[dbo].[JerseySizes]";
            try {
                con = openConnection(); // Mở kết nối đến cơ sở dữ liệu
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(JerseySizeDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
            st = con.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                int sizeID = rs.getInt("SizeID");
                int jerseyID = rs.getInt("JerseyID");
                JerseySizeEnum jerseySize = JerseySizeEnum.valueOf(rs.getString("JerseySize"));
                int jerseyQuantity = rs.getInt("JerseyQuantity");

                JerseySize size = new JerseySize(
                    sizeID,
                    jerseyID,
                    jerseySize,
                    jerseyQuantity
                );
                jerseySizeList.add(size);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return jerseySizeList;
    }

    public Optional<JerseySize> getBySizeAndJerseyID(
        int id,
        String size
    ) {
        Optional<JerseySize> result = Optional.empty();

        try {
            sql = "SELECT TOP (1000) [SizeID]\n" + "      ,[JerseyID]\n" + "      ,[JerseySize]\n" + "      ,[JerseyQuantity]\n" + "  FROM [RealClub].[dbo].[JerseySizes]\n" + "  where JerseySize= ? and JerseyID =?";
            con = openConnection();
            st = con.prepareStatement(sql);
            st.setString(
                1,
                size
            );

            st.setInt(
                2,
                id
            );
            rs = st.executeQuery();

            if (rs.next()) {
                int sizeID = rs.getInt("SizeID");
                int jerseyID = rs.getInt("JerseyID");
                JerseySizeEnum jerseySize = JerseySizeEnum.valueOf(rs.getString("JerseySize"));
                int jerseyQuantity = rs.getInt("JerseyQuantity");

                JerseySize jsize = new JerseySize(
                    sizeID,
                    jerseyID,
                    jerseySize,
                    jerseyQuantity
                );
                result = Optional.of(jsize);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return result;
    }

    @Override
    public Optional<JerseySize> get(int id) {
        Optional<JerseySize> result = Optional.empty();
        try {
            sql = "SELECT [SizeID], [JerseyID], [JerseySize], [JerseyQuantity] " + "FROM [RealClub].[dbo].[JerseySizes] WHERE [SizeID] = ?";
            con = openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                id
            );
            rs = st.executeQuery();

            if (rs.next()) {
                int sizeID = rs.getInt("SizeID");
                int jerseyID = rs.getInt("JerseyID");
                JerseySizeEnum jerseySize = JerseySizeEnum.valueOf(rs.getString("JerseySize"));
                int jerseyQuantity = rs.getInt("JerseyQuantity");

                JerseySize size = new JerseySize(
                    sizeID,
                    jerseyID,
                    jerseySize,
                    jerseyQuantity
                );
                result = Optional.of(size);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return result;
    }

    @Override
    public void save(JerseySize size) {
        try {
            sql = "INSERT INTO [RealClub].[dbo].[JerseySizes] ([JerseyID], [JerseySize], [JerseyQuantity]) " + "VALUES (?, ?, ?)";
            con = openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                size.getJerseyID()
            );
            st.setString(
                2,
                size.getJerseySize().toString()
            );
            st.setInt(
                3,
                size.getJerseyQuantity()
            );
            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }

    @Override
    public void update(JerseySize size) {
        try {
            sql = "UPDATE [RealClub].[dbo].[JerseySizes] " + "SET [JerseyID] = ?, [JerseySize] = ?, [JerseyQuantity] = ? WHERE [SizeID] = ?";
            con = openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                size.getJerseyID()
            );
            st.setString(
                2,
                size.getJerseySize().toString()
            );
            st.setInt(
                3,
                size.getJerseyQuantity()
            );
            st.setInt(
                4,
                size.getSizeID()
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
            sql = "DELETE FROM [RealClub].[dbo].[JerseySizes] WHERE [SizeID] = ?";
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
