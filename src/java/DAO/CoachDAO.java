/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Coach;
import dal.ConnectDB;

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
public class CoachDAO extends ConnectDB implements DAO<Coach> {

    private String sql;
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    @Override
    public List<Coach> getAll() {
        List<Coach> coaches = new ArrayList<>();
        sql = "SELECT [CoachID]\n" + "      ,[UserID]\n" + "      ,[CoachName]\n" + "  FROM [RealClub].[dbo].[Coach]";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Coach c = new Coach();
                c.setCoachID(rs.getInt("CoachID"));
                c.setCoachName(rs.getString("CoachName"));

                coaches.add(c);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(PlayerDAO.class.getName()).log(
                Level.SEVERE,
                null,
                e
            );
        } finally {
            closeResources();
        }
        return coaches;
    }

    @Override
    public Optional<Coach> get(int id) {
        sql = "SELECT [CoachID], [UserID], [CoachName] FROM [RealClub].[dbo].[Coach] WHERE [CoachID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                id
            );
            rs = st.executeQuery();
            if (rs.next()) {
                Coach c = new Coach();
                c.setCoachID(rs.getInt("CoachID"));
                c.setUserID(rs.getInt("UserID"));
                c.setCoachName(rs.getString("CoachName"));
                return Optional.of(c);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CoachDAO.class.getName()).log(
                Level.SEVERE,
                null,
                e
            );
        } finally {
            closeResources();
        }
        return Optional.empty();
    }

    @Override
    public void save(Coach coach) {
        sql = "INSERT INTO [RealClub].[dbo].[Coach] ([UserID], [CoachName]) VALUES (?, ?)";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                coach.getUserID()
            );
            st.setString(
                2,
                coach.getCoachName()
            );
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Player updated successfully.");
            } else {
                System.out.println("Failed to update player.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CoachDAO.class.getName()).log(
                Level.SEVERE,
                null,
                e
            );
        } finally {
            closeResources();
        }
    }

    @Override
    public void update(Coach coach) {
        sql = "UPDATE [RealClub].[dbo].[Coach] SET [UserID] = ?, [CoachName] = ? WHERE [CoachID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                coach.getUserID()
            );
            st.setString(
                2,
                coach.getCoachName()
            );
            st.setInt(
                3,
                coach.getCoachID()
            );
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Player updated successfully.");
            } else {
                System.out.println("Failed to update player.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CoachDAO.class.getName()).log(
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
        sql = "DELETE FROM [RealClub].[dbo].[Coach] WHERE [CoachID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                id
            );
            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CoachDAO.class.getName()).log(
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
            e.printStackTrace();
        }
    }
}
