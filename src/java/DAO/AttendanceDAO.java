/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package DAO;

import Model.Attendance;
import dal.ConnectDB;

import java.sql.Date;
import java.sql.*;
import java.time.LocalDate;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Zanis
 */
public class AttendanceDAO extends ConnectDB implements DAO<Attendance> {

    /**
     * @param args the command line arguments
     */
    private String sql;
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    @Override
    public List<Attendance> getAll() {
        List<Attendance> list = new ArrayList<>();
        sql = "SELECT [AttendanceID]\n" + "      ,[PlayerID]\n" + "      ,[TrainingID]\n" + "      ,[CheckDate]\n" + "      ,[IsPresent]\n" + "  FROM [RealClub].[dbo].[AttendanceCheck]";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Attendance t = new Attendance();
                t.setAttendanceID(rs.getInt("AttendanceID"));
                t.setPlayerID(rs.getInt("PlayerID"));
                t.setTrainingID(rs.getInt("TrainingID"));
                Date sqlDate = rs.getDate("CheckDate");
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    t.setCheckDate(localDate);
                }
                t.setIsPresent(rs.getBoolean("IsPresent"));
                list.add(t);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(TrainingScheduleDAO.class.getName()).log(
                Level.SEVERE,
                null,
                e
            );
        } finally {
            closeResources();
        }
        return list;
    }

    public List<Attendance> getAttendance(int id) {
        List<Attendance> list = new ArrayList<>();
        sql = "SELECT [AttendanceID]\n" + "      ,[PlayerID]\n" + "      ,[TrainingID]\n" + "      ,[CheckDate]\n" + "      ,[IsPresent]\n" + "  FROM [RealClub].[dbo].[AttendanceCheck]\n" + "  WHERE [TrainingID] = ?;";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                id
            );
            rs = st.executeQuery();
            while (rs.next()) {
                Attendance t = new Attendance();
                t.setAttendanceID(rs.getInt("AttendanceID"));
                t.setPlayerID(rs.getInt("PlayerID"));
                t.setTrainingID(rs.getInt("TrainingID"));
                Date sqlDate = rs.getDate("CheckDate");
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    t.setCheckDate(localDate);
                }
                t.setIsPresent(rs.getBoolean("IsPresent"));
                list.add(t);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(TrainingScheduleDAO.class.getName()).log(
                Level.SEVERE,
                null,
                e
            );
        } finally {
            closeResources();
        }
        return list;
    }

    @Override
    public void save(Attendance t) {
        sql = "INSERT INTO [RealClub].[dbo].[AttendanceCheck] ([PlayerID],[TrainingID],[CheckDate],[IsPresent]) VALUES (?, ?, ?, ?)";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                t.getPlayerID()
            );
            st.setInt(
                2,
                t.getTrainingID()
            );
            if (t.getCheckDate() != null) {
                st.setDate(
                    3,
                    java.sql.Date.valueOf(t.getCheckDate())
                );
            } else {
                st.setDate(
                    3,
                    null
                );
            }
            st.setBoolean(
                4,
                t.isIsPresent()
            );
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Attendance updated successfully.");
            } else {
                System.out.println("Failed to update attendance.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(AttendanceDAO.class.getName()).log(
                Level.SEVERE,
                null,
                e
            );
        } finally {
            closeResources();
        }
    }

    @Override
    public void update(Attendance t) {
        try {
            sql = "UPDATE [dbo].[AttendanceCheck]\n" + "   SET [PlayerID] = (?)\n" + "      ,[TrainingID] = (?)\n" + "      ,[CheckDate] = (?)\n" + "      ,[IsPresent] = (?)\n" + " WHERE [AttendanceID]=?";

            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(AttendanceDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                t.getPlayerID()
            );
            st.setInt(
                2,
                t.getTrainingID()
            );
            if (t.getCheckDate() != null) {
                st.setDate(
                    3,
                    java.sql.Date.valueOf(t.getCheckDate())
                );
            } else {
                st.setDate(
                    3,
                    null
                );
            }
            st.setBoolean(
                4,
                t.isIsPresent()
            );
            st.setInt(
                5,
                t.getAttendanceID()
            );

            int rowsAffected = st.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("That bai");
            } else {
                System.out.println("Thanh cong update");
            }

        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(AttendanceDAO.class.getName()).log(
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
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
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

    @Override
    public Optional<Attendance> get(int id) {
        return null;
    }

    public Map<Integer, Map<Integer, Boolean>> getAttendanceData() {
        Map<Integer, Map<Integer, Boolean>> attendanceData = new TreeMap<>();
        sql = "SELECT PlayerID, TrainingID, IsPresent FROM AttendanceCheck ORDER BY PlayerID, TrainingID";

        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                int playerId = rs.getInt("PlayerID");
                int trainingId = rs.getInt("TrainingID");
                boolean isPresent = rs.getBoolean("IsPresent");

                attendanceData.computeIfAbsent(
                    playerId,
                    k -> new TreeMap<>()
                ).put(
                    trainingId,
                    isPresent
                );
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(AttendanceDAO.class.getName()).log(
                Level.SEVERE,
                "Error getting attendance data",
                e
            );
        } finally {
            closeResources();
        }
        return attendanceData;
    }

    public Set<Integer> getAllTrainingIds() {
        Set<Integer> trainingIds = new TreeSet<>();
        sql = "SELECT DISTINCT TrainingID FROM AttendanceCheck ORDER BY TrainingID";

        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                trainingIds.add(rs.getInt("TrainingID"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(AttendanceDAO.class.getName()).log(
                Level.SEVERE,
                "Error getting training IDs",
                e
            );
        } finally {
            closeResources();
        }
        return trainingIds;
    }
}
