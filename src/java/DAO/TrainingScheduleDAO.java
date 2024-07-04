/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package DAO;

import Model.TrainingSchedule;
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
public class TrainingScheduleDAO extends ConnectDB implements DAO<TrainingSchedule> {

    private String sql;
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    @Override
    public List<TrainingSchedule> getAll() {
        List<TrainingSchedule> list = new ArrayList<>();
        sql = "SELECT [TrainingID]\n" + "      ,[TrainingDate]\n" + "      ,[TrainingTime]\n" + "      ,[Location]\n" + "      ,[Description]\n" + "  FROM [RealClub].[dbo].[TrainingSchedule]";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                TrainingSchedule t = new TrainingSchedule();
                t.setTrainingID(rs.getInt("TrainingID"));
                Date sqlDate = rs.getDate("TrainingDate");
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    t.setTrainingDate(localDate);
                }
                t.setTrainingTime(rs.getString("TrainingTime"));
                t.setLocation(rs.getString("Location"));
                t.setDescription(rs.getString("Description"));
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
    public Optional<TrainingSchedule> get(int id) {
        sql = "SELECT [TrainingID]\n" + "      ,[TrainingDate]\n" + "      ,[TrainingTime]\n" + "      ,[Location]\n" + "      ,[Description]\n" + "  FROM [RealClub].[dbo].[TrainingSchedule]\n" + "  WHERE [TrainingID] = ?;";
        TrainingSchedule t = new TrainingSchedule();
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                id
            );
            rs = st.executeQuery();
            if (rs.next()) {
                t.setTrainingID(rs.getInt("TrainingID"));
                Date sqlDate = rs.getDate("TrainingDate");
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    t.setTrainingDate(localDate);
                }
                t.setTrainingTime(rs.getString("TrainingTime"));
                t.setLocation(rs.getString("Location"));
                t.setDescription(rs.getString("Description"));
                return Optional.of(t);
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
        return Optional.empty();
    }

    @Override
    public void save(TrainingSchedule t) {
        sql = "INSERT INTO [RealClub].[dbo].[TrainingSchedule] ([TrainingDate],[TrainingTime],[Location],[Description]) VALUES (?, ?, ?, ?)";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setDate(
                1,
                Date.valueOf(t.getTrainingDate())
            );
            st.setString(
                2,
                t.getTrainingTime()
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
                System.out.println("TrainingSchedule saved successfully.");
            } else {
                System.out.println("Failed to save TrainingSchedule.");
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
    }

    @Override
    public void update(TrainingSchedule t) {
        try {
            sql = "UPDATE [dbo].[TrainingSchedule]\n" + "   SET [TrainingDate] = (?)\n" + "      ,[TrainingTime] = (?)\n" + "      ,[Location] = (?)\n" + "      ,[Description] = (?)\n" + " WHERE [TrainingID]=?";

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
            st.setDate(
                1,
                Date.valueOf(t.getTrainingDate())
            );
            st.setString(
                2,
                t.getTrainingTime()
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
                t.getTrainingID()
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
                Logger.getLogger(TrainingScheduleDAO.class.getName()).log(
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
            TrainingSchedule t = new TrainingSchedule();
            sql = "DELETE FROM [dbo].[TrainingSchedule]\n" + "      WHERE [TrainingID]=?";

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

    public Map<Integer, LocalDate> getTrainingDates() {
        Map<Integer, LocalDate> trainingDates = new HashMap<>();
        sql = "SELECT TrainingID, TrainingDate FROM [RealClub].[dbo].[TrainingSchedule]";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                int trainingId = rs.getInt("TrainingID");
                Date sqlDate = rs.getDate("TrainingDate");
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    trainingDates.put(
                        trainingId,
                        localDate
                    );
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(TrainingScheduleDAO.class.getName()).log(
                Level.SEVERE,
                "Error getting training dates",
                e
            );
        } finally {
            closeResources();
        }
        return trainingDates;
    }


}
