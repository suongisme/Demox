/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.MatchSchedule;
import Model.Tournament;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Desktop
 */
public class MatchScheduleDAO extends dal.ConnectDB implements DAO<MatchSchedule> {

    private String sql;
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    public List<MatchSchedule> getMatchAlreadyStatistic() {
        try {
            List<MatchSchedule> listMatches = new ArrayList<>();
            sql = "SELECT ms.MatchID, ms.AwayTeamID, ms.HomeTeamID, ms.MatchDate, ms.MatchLocation, ms.Tournament\n" + "FROM [RealClub].[dbo].[MatchSchedule] ms\n" + "LEFT JOIN (\n" + "    SELECT MatchID, COUNT(*) AS StatisticCount\n" + "    FROM [RealClub].[dbo].[MatchStatistic]\n" + "    GROUP BY MatchID\n" + ") msd ON ms.MatchID = msd.MatchID\n" + "WHERE msd.MatchID IS NOT NULL OR msd.StatisticCount >= 1;";

            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
            st = con.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                MatchSchedule m = new MatchSchedule();
                m.setMatchID(rs.getInt(1));
                m.setAwayTeamID(rs.getInt(2));
                m.setHomeTeamID(rs.getInt(3));
                Date sqlDate = rs.getDate(4);
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    m.setMatchDate(localDate);
                }
                m.setMatchLocation(rs.getString(5));
                String tour = rs.getString(6);
                if (tour != null) {
                    m.setTournament(Tournament.valueOf(rs.getString(6).trim()));
                }
                listMatches.add(m);
            }
            return listMatches;
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
        return null;
    }

    public List<MatchSchedule> getMatchHaveNotStatistic() {
        try {
            List<MatchSchedule> listMatches = new ArrayList<>();
            sql = "SELECT \n" + "    ms.MatchID, \n" + "    ms.AwayTeamID, \n" + "    ms.HomeTeamID, \n" + "    ms.MatchDate, \n" + "    ms.MatchLocation, \n" + "    ms.Tournament\n" + "FROM \n" + "    [RealClub].[dbo].[MatchSchedule] ms\n" + "LEFT JOIN \n" + "    (\n" + "        SELECT \n" + "            MatchID, \n" + "            COUNT(*) AS StatisticCount\n" + "        FROM \n" + "            [RealClub].[dbo].[MatchStatistic]\n" + "        GROUP BY \n" + "            MatchID\n" + "    ) msd ON ms.MatchID = msd.MatchID\n" + "WHERE \n" + "    (msd.MatchID IS NULL OR msd.StatisticCount < 2)\n" + "    AND ms.MatchDate < GETDATE();";

            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
            st = con.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                MatchSchedule m = new MatchSchedule();
                m.setMatchID(rs.getInt(1));
                m.setAwayTeamID(rs.getInt(2));
                m.setHomeTeamID(rs.getInt(3));
                Date sqlDate = rs.getDate(4);
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    m.setMatchDate(localDate);
                }
                m.setMatchLocation(rs.getString(5));
                String tour = rs.getString(6);
                if (tour != null) {
                    m.setTournament(Tournament.valueOf(rs.getString(6).trim()));
                }
                listMatches.add(m);
            }
            return listMatches;
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
        return null;
    }

    @Override
    public List<MatchSchedule> getAll() {
        try {
            List<MatchSchedule> listMatches = new ArrayList<>();
            sql = "SELECT TOP (1000) [MatchID]\n" + "      ,[AwayTeamID]\n" + "      ,[HomeTeamID]\n" + "      ,[MatchDate]\n" + "      ,[MatchLocation]\n" + "      ,[Tournament]\n" + "  FROM [RealClub].[dbo].[MatchSchedule]";

            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
            st = con.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                MatchSchedule m = new MatchSchedule();
                m.setMatchID(rs.getInt(1));
                m.setAwayTeamID(rs.getInt(2));
                m.setHomeTeamID(rs.getInt(3));
                Date sqlDate = rs.getDate(4);
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    m.setMatchDate(localDate);
                }
                m.setMatchLocation(rs.getString(5));
                String tour = rs.getString(6);
                if (tour != null) {
                    m.setTournament(Tournament.valueOf(rs.getString(6).trim()));
                }
                listMatches.add(m);
            }
            return listMatches;
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
        return null;
    }

    @Override
    public Optional<MatchSchedule> get(int id) {
        try {
            sql = "SELECT [MatchID], [AwayTeamID], [HomeTeamID], [MatchDate], [MatchLocation], [Tournament] FROM [RealClub].[dbo].[MatchSchedule] WHERE [MatchID] = ?";
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                id
            );
            rs = st.executeQuery();

            if (rs.next()) {
                MatchSchedule m = new MatchSchedule();
                m.setMatchID(rs.getInt("MatchID"));
                m.setAwayTeamID(rs.getInt("AwayTeamID"));
                m.setHomeTeamID(rs.getInt("HomeTeamID"));
                Date sqlDate = rs.getDate("MatchDate");
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    m.setMatchDate(localDate);
                }
                m.setMatchLocation(rs.getString("MatchLocation"));
                String tour = rs.getString(6);
                if (tour != null) {
                    m.setTournament(Tournament.valueOf(tour.trim()));
                }

                return Optional.of(m);
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
        return Optional.empty();
    }

    @Override
    public void save(MatchSchedule t) {
        try {
            sql = "INSERT INTO [dbo].[MatchSchedule] ([AwayTeamID], [HomeTeamID], [MatchDate], [MatchLocation], [Tournament]) VALUES (?, ?, ?, ?,?)";
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                t.getAwayTeamID()
            );
            st.setInt(
                2,
                t.getHomeTeamID()
            );

            if (t.getMatchDate() != null) {
                st.setDate(
                    3,
                    java.sql.Date.valueOf(t.getMatchDate())
                );
            } else {
                st.setDate(
                    3,
                    null
                );
            }

            st.setString(
                4,
                t.getMatchLocation()
            );
            st.setString(
                5,
                t.getTournament().toString()
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
    public void update(MatchSchedule t) {
        try {
            sql = "UPDATE [RealClub].[dbo].[MatchSchedule] SET [AwayTeamID] = ?, [HomeTeamID] = ?, [MatchDate] = ?, [MatchLocation] = ?, [Tournament]=? WHERE [MatchID] = ?";
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                t.getAwayTeamID()
            );
            st.setInt(
                2,
                t.getHomeTeamID()
            );
            st.setDate(
                3,
                Date.valueOf(t.getMatchDate())
            );
            st.setString(
                4,
                t.getMatchLocation()
            );
            st.setString(
                5,
                t.getTournament().toString()
            );
            st.setInt(
                6,
                t.getMatchID()
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
            sql = "DELETE FROM [RealClub].[dbo].[MatchSchedule] WHERE [MatchID] = ?";
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                id
            );
            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("fail");
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

    public Boolean deleteB(int id) {
        try {
            sql = "DELETE FROM [RealClub].[dbo].[MatchSchedule] WHERE [MatchID] = ?";
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                id
            );
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                return true;
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("fail");
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
        return false;
    }

    public void add(MatchSchedule match) {
        try {
            // Tạo câu lệnh SQL để chèn một trận đấu mới vào cơ sở dữ liệu
            String sql = "INSERT INTO [RealClub].[dbo].[MatchSchedule] ([AwayTeamID], [HomeTeamID], [MatchDate], [MatchLocation], [Tournament]) VALUES (?, ?, ?, ?, ?)";

            // Mở kết nối đến cơ sở dữ liệu
            con = this.openConnection();

            // Tạo một PreparedStatement từ kết nối với câu lệnh SQL
            st = con.prepareStatement(sql);

            // Đặt các tham số cho câu lệnh SQL từ đối tượng MatchSchedule được truyền vào
            st.setInt(
                1,
                match.getAwayTeamID()
            );
            st.setInt(
                2,
                match.getHomeTeamID()
            );
            st.setDate(
                3,
                Date.valueOf(match.getMatchDate())
            );
            st.setString(
                4,
                match.getMatchLocation()
            );
            st.setString(
                5,
                match.getTournament().toString()
            );

            // Thực thi câu lệnh SQL
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

    public List<MatchSchedule> SearchMatch(String valueSearch) {
        try {
            String searchValue = "%" + valueSearch + "%";
            List<MatchSchedule> listMatches = new ArrayList<>();
            sql = "SELECT \n" + "    m.MatchID,\n" + "    m.MatchDate,\n" + "    m.MatchLocation," + "    m.Tournament,\n" + "    t1.TeamID AS HomeTeamID,\n" + "    t2.TeamID AS AwayTeamID,\n" + "    t1.TeamName AS HomeTeam, " + "    t2.TeamName AS AwayTeam \n" + "FROM \n" + "    MatchSchedule m\n" + "LEFT JOIN \n" + "    Teams t1 ON t1.TeamID = m.HomeTeamID\n" + "LEFT JOIN \n" + "    Teams t2 ON t2.TeamID = m.AwayTeamID\n" + "WHERE \n" + "    t1.TeamName LIKE ?\n" + "    OR t2.TeamName LIKE ?\n" + "    OR m.Tournament LIKE ?\n" + "    OR m.MatchDate LIKE ?\n" + "    OR m.MatchLocation LIKE ?" + "    OR m.MatchID LIKE ?";

            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
            st = con.prepareStatement(sql);
            for (int i = 1; i <= 6; i++) {
                st.setString(
                    i,
                    searchValue
                );
            }
            rs = st.executeQuery();

            while (rs.next()) {
                MatchSchedule m = new MatchSchedule();
                m.setMatchID(rs.getInt("MatchID"));
                m.setAwayTeamID(rs.getInt("AwayTeamID"));
                m.setHomeTeamID(rs.getInt("HomeTeamID"));
                Date sqlDate = rs.getDate("MatchDate");
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    m.setMatchDate(localDate);
                }
                m.setMatchLocation(rs.getString("MatchLocation"));
                String tour = rs.getString("Tournament");
                if (tour != null) {
                    m.setTournament(Tournament.valueOf(tour.trim()));
                }
                listMatches.add(m);
            }
            return listMatches;
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
        return null;
    }

}
