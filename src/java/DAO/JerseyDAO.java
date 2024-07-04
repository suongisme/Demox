/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Jersey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


/**
 * @author Desktop
 */
public class JerseyDAO extends dal.ConnectDB implements DAO<Jersey> {

    private String sql;
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    @Override
    public List<Jersey> getAll() {
        List<Jersey> jerseyList = new ArrayList<>();
        try {
            sql = "SELECT [JerseyID], [JerseyName], [JerseyDescription], [JerseyPrice], [JerseyImage] " + "FROM [RealClub].[dbo].[Jerseys]";
            con = this.openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                int jerseyID = rs.getInt("JerseyID");
                String jerseyName = rs.getString("JerseyName");
                String jerseyDescription = rs.getString("JerseyDescription");
                double jerseyPrice = rs.getDouble("JerseyPrice");
                String jerseyImage = rs.getString("JerseyImage");

                Jersey jersey = new Jersey(
                    jerseyID,
                    jerseyName,
                    jerseyDescription,
                    jerseyPrice,
                    jerseyImage
                );
                jerseyList.add(jersey);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
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
        return jerseyList;
    }

    @Override
    public Optional<Jersey> get(int id) {
        Jersey jersey = null;
        try {
            sql = "SELECT [JerseyID], [JerseyName], [JerseyDescription], [JerseyPrice], [JerseyImage] " + "FROM [RealClub].[dbo].[Jerseys] WHERE [JerseyID] = ?";
            con = openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                id
            );
            rs = st.executeQuery();

            if (rs.next()) {
                int jerseyID = rs.getInt("JerseyID");
                String jerseyName = rs.getString("JerseyName");
                String jerseyDescription = rs.getString("JerseyDescription");
                double jerseyPrice = rs.getDouble("JerseyPrice");
                String jerseyImage = rs.getString("JerseyImage");

                jersey = new Jersey(
                    jerseyID,
                    jerseyName,
                    jerseyDescription,
                    jerseyPrice,
                    jerseyImage
                );
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
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
        return Optional.ofNullable(jersey);
    }

    @Override
    public void save(Jersey t) {
        try {
            sql = "INSERT INTO [RealClub].[dbo].[Jerseys] ([JerseyName], [JerseyDescription], [JerseyPrice], [JerseyImage]) " + "VALUES (?, ?, ?, ?)";
            con = openConnection();
            st = con.prepareStatement(sql);
            st.setString(
                1,
                t.getJerseyName()
            );
            st.setString(
                2,
                t.getJerseyDescription()
            );
            st.setDouble(
                3,
                t.getJerseyPrice()
            );
            st.setString(
                4,
                t.getJerseyImage()
            );

            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // Đóng các tài nguyên
            try {
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
    public void update(Jersey t) {
        try {
            sql = "UPDATE [RealClub].[dbo].[Jerseys] SET [JerseyName] = ?, [JerseyDescription] = ?, [JerseyPrice] = ?, [JerseyImage] = ? " + "WHERE [JerseyID] = ?";
            con = openConnection();
            st = con.prepareStatement(sql);
            st.setString(
                1,
                t.getJerseyName()
            );
            st.setString(
                2,
                t.getJerseyDescription()
            );
            st.setDouble(
                3,
                t.getJerseyPrice()
            );
            st.setString(
                4,
                t.getJerseyImage()
            );
            st.setInt(
                5,
                t.getJerseyID()
            );

            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // Đóng các tài nguyên
            try {
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
            sql = "DELETE FROM [RealClub].[dbo].[Jerseys] WHERE [JerseyID] = ?";
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
            // Đóng các tài nguyên
            try {
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

}
