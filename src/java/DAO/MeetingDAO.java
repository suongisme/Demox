/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package DAO;

import Model.Meeting;
import dal.ConnectDB;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Zanis
 */
public class MeetingDAO extends ConnectDB implements DAO<Meeting> {

    private String sql;
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    @Override
    public List<Meeting> getAll() {
        List<Meeting> list = new ArrayList<>();
        sql = "SELECT [MeetingID]\n" + "      ,[MeetingDate]\n" + "      ,[MeetingTime]\n" + "      ,[Location]\n" + "      ,[Description]\n" + "  FROM [RealClub].[dbo].[MeetingSchedule]";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Meeting t = new Meeting();
                t.setMeetingID(rs.getInt("MeetingID"));
                Date sqlDate = rs.getDate("MeetingDate");
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    t.setMeetingDate(localDate);
                }
                t.setMeetingTime(rs.getString("MeetingTime"));
                t.setLocation(rs.getString("Location"));
                t.setDescription(rs.getString("Description"));
                list.add(t);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(MeetingDAO.class.getName()).log(
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
    public Optional<Meeting> get(int id) {
        sql = "SELECT [MeetingID]\n" + "      ,[MeetingDate]\n" + "      ,[MeetingTime]\n" + "      ,[Location]\n" + "      ,[Description]\n" + "  FROM [RealClub].[dbo].[MeetingSchedule]\n" + "  WHERE [MeetingID] = ?;";
        Meeting t = new Meeting();
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                id
            );
            rs = st.executeQuery();
            if (rs.next()) {
                t.setMeetingID(rs.getInt("MeetingID"));
                Date sqlDate = rs.getDate("MeetingDate");
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    t.setMeetingDate(localDate);
                }
                t.setMeetingTime(rs.getString("MeetingTime"));
                t.setLocation(rs.getString("Location"));
                t.setDescription(rs.getString("Description"));
                return Optional.of(t);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(MeetingDAO.class.getName()).log(
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
    public void save(Meeting t) {
        sql = "INSERT INTO [RealClub].[dbo].[MeetingSchedule] ([MeetingDate]\n" + "      ,[MeetingTime]\n" + "      ,[Location]\n" + "      ,[Description]) VALUES (?, ?, ?, ?)";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setDate(
                1,
                Date.valueOf(t.getMeetingDate())
            );
            st.setString(
                2,
                t.getMeetingTime()
            );
            st.setString(
                3,
                t.getLocation()
            );
            st.setString(
                4,
                t.getDescription()
            );
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("MeetingSchedule saved successfully.");
            } else {
                System.out.println("Failed to save MeetingSchedule.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(MeetingDAO.class.getName()).log(
                Level.SEVERE,
                null,
                e
            );
        } finally {
            closeResources();
        }

    }

    @Override
    public void update(Meeting t) {
        try {
            sql = "UPDATE [dbo].[MeetingSchedule]\n" + "   SET [MeetingDate] = (?)\n" + "      ,[MeetingTime] = (?)\n" + "      ,[Location] = (?)\n" + "      ,[Description] = (?)\n" + " WHERE [MeetingID]=?";

            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(MeetingDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
            st = con.prepareStatement(sql);
            st.setDate(
                1,
                Date.valueOf(t.getMeetingDate())
            );
            st.setString(
                2,
                t.getMeetingTime()
            );
            st.setString(
                3,
                t.getLocation()
            );
            st.setString(
                4,
                t.getDescription()
            );
            st.setInt(
                5,
                t.getMeetingID()
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
                Logger.getLogger(MeetingDAO.class.getName()).log(
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
        try {
            Meeting t = new Meeting();
            sql = "DELETE FROM [dbo].[MeetingSchedule]\n" + "      WHERE [MeetingID]=?";

            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(TrainingScheduleDAO.class.getName()).log(
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
