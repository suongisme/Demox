/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Team;
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
public class TeamDAO extends ConnectDB implements DAO<Team> {

    private String sql;
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    @Override
    public List<Team> getAll() {
        List<Team> teams = new ArrayList<>();
        sql = "SELECT TOP (1000) [TeamID]\n" + "      ,[TeamName]\n" + "  FROM [RealClub].[dbo].[Teams]";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Team t = new Team();
                t.setTeamID(rs.getInt(1));
                t.setTeamName(rs.getString(2));
                teams.add(t);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(TeamDAO.class.getName()).log(
                Level.SEVERE,
                null,
                e
            );
        } finally {
            closeResources();
        }
        return teams;
    }

    @Override
    public Optional<Team> get(int id) {
        Optional<Team> team = Optional.empty();
        sql = "SELECT [TeamID], [TeamName],flag FROM [RealClub].[dbo].[Teams] WHERE [TeamID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                id
            );
            rs = st.executeQuery();
            if (rs.next()) {
                Team t = new Team();
                t.setTeamID(rs.getInt("TeamID"));
                t.setTeamName(rs.getString("TeamName"));
                t.setFlag(rs.getString("flag"));
                team = Optional.of(t);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(TeamDAO.class.getName()).log(
                Level.SEVERE,
                null,
                e
            );
        } finally {
            closeResources();
        }
        return team;
    }

    @Override
    public void save(Team t) {
        sql = "INSERT INTO [RealClub].[dbo].[Teams] ([TeamName]) VALUES (?)";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setString(
                1,
                t.getTeamName()
            );
            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(TeamDAO.class.getName()).log(
                Level.SEVERE,
                null,
                e
            );
        } finally {
            closeResources();
        }
    }

    @Override
    public void update(Team t) {
        sql = "UPDATE [RealClub].[dbo].[Teams] SET [TeamName] = ? WHERE [TeamID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setString(
                1,
                t.getTeamName()
            );
            st.setInt(
                2,
                t.getTeamID()
            );
            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(TeamDAO.class.getName()).log(
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
        sql = "DELETE FROM [RealClub].[dbo].[Teams] WHERE [TeamID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                id
            );
            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(TeamDAO.class.getName()).log(
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
