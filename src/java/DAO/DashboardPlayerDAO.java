/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Dashboard1DTO;
import dal.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author quangminh
 */
public class DashboardPlayerDAO extends ConnectDB {

    private String sql;
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    public Dashboard1DTO getDashboard1DTO(int id) {
        sql = " select sum([GoalsScored]) ttGoals,sum([YellowCards]) ttYellow,sum([RedCards]) ttRed from [PlayerPerformance] where PlayerID = " + id + "  group by PlayerID";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Dashboard1DTO c = new Dashboard1DTO(
                    rs.getInt(1),
                    rs.getInt(2),
                    rs.getInt(3)
                );
                return c;
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
        return null;
    }

    public int gettotalMeetingInMonth(int month) {
        sql = " SELECT  COUNT(*) AS MeetingCount  FROM   [dbo].[MeetingSchedule]\n" + "WHERE    YEAR(MeetingDate) = YEAR(GETDATE()) and     MONTH(MeetingDate) = " + month + "GROUP BY    MONTH(MeetingDate)";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
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
        return 0;
    }

    public int gettotalTreatmentInMonth(int month) {
        sql = " SELECT \n" + "    COUNT(*) AS TreatmentCount\n" + "FROM \n" + "    [dbo].[TreatmentSchedule]\n" + "WHERE \n" + "    DATEPART(YEAR, TreatmentDate) = YEAR(GETDATE()) and DATEPART(MONTH, TreatmentDate) = " + month + "GROUP BY \n" + "    DATEPART(MONTH, TreatmentDate)";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
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
        return 0;
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
