/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.MatchStatistic;
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
public class MatchStatisticDAO extends ConnectDB implements DAO<MatchStatistic> {

    private String sql;
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    public static void main(String[] args) {
        System.out.println(new MatchStatisticDAO().get(1));
    }

    public List<MatchStatistic> SearchByTimeName(String searchParam) {
        String searchValue = "%" + searchParam + "%";
        List<MatchStatistic> matchStatistics = new ArrayList<>();
        sql = "SELECT\n" + "    MS.MatchStatisticID,\n" + "    MS.MatchID,\n" + "    MS.TeamID,\n" + "    MS.Score,\n" + "    MS.YellowCards,\n" + "    MS.RedCards,\n" + "    MS.TotalShots,\n" + "    MS.CornerKicks,\n" + "    MS.BallPossession,\n" + "    MS.Passes,\n" + "   \n" + "    T1.TeamName AS HomeTeamName,\n" + "    T2.TeamName AS AwayTeamName\n" + "FROM\n" + "    [RealClub].[dbo].[MatchStatistic] AS MS\n" + "INNER JOIN\n" + "    [RealClub].[dbo].[MatchSchedule] AS MSc ON MS.MatchID = MSc.MatchID\n" + "INNER JOIN\n" + "    [RealClub].[dbo].[Teams] AS T1 ON MSc.HomeTeamID = T1.TeamID\n" + "INNER JOIN\n" + "    [RealClub].[dbo].[Teams] AS T2 ON MSc.AwayTeamID = T2.TeamID\n" + "\n" + "WHERE( T2.TeamName LIKE ?)";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setString(
                1,
                searchValue
            );
            rs = st.executeQuery();
            while (rs.next()) {
                MatchStatistic m = new MatchStatistic();
                m.setMatchStatisticID(rs.getInt(1));
                m.setMatchID(rs.getInt(2));
                m.setTeamID(rs.getInt(3));
                m.setScore(rs.getInt(4));
                m.setYellowCards(rs.getInt(5));
                m.setRedCards(rs.getInt(6));
                m.setTotalShots(rs.getInt(7));
                m.setCornerKicks(rs.getInt(8));
                m.setBallPossession(rs.getDouble(9));
                m.setPasses(rs.getInt(10));
                matchStatistics.add(m);
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
        return matchStatistics;
    }

    @Override
    public List<MatchStatistic> getAll() {
        List<MatchStatistic> matchStatistics = new ArrayList<>();
        sql = "SELECT [MatchStatisticID]\n" + "      ,[MatchID]\n" + "      ,[TeamID]\n" + "      ,[Score]\n" + "      ,[YellowCards]\n" + "      ,[RedCards]\n" + "      ,[TotalShots]\n" + "      ,[CornerKicks]\n" + "      ,[BallPossession]\n" + "      ,[Passes]\n" + "  FROM [dbo].[MatchStatistic]" + " order by MatchID asc";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                MatchStatistic m = new MatchStatistic();
                m.setMatchStatisticID(rs.getInt(1));
                m.setMatchID(rs.getInt(2));
                m.setTeamID(rs.getInt(3));
                m.setScore(rs.getInt(4));
                m.setYellowCards(rs.getInt(5));
                m.setRedCards(rs.getInt(6));
                m.setTotalShots(rs.getInt(7));
                m.setCornerKicks(rs.getInt(8));
                m.setBallPossession(rs.getDouble(9));
                m.setPasses(rs.getInt(10));
                matchStatistics.add(m);
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
        return matchStatistics;
    }

    public Optional<MatchStatistic> getMatchStatByTeamID(
        int id,
        int matchID
    ) {
        String sql = "SELECT [MatchStatisticID], [MatchID], [TeamID], [Score], [YellowCards], [RedCards], [TotalShots], [CornerKicks], [BallPossession], [Passes] FROM [dbo].[MatchStatistic] WHERE [TeamID] = ? AND [MatchID]=?";
        try (
            Connection con = openConnection();
            PreparedStatement st = con.prepareStatement(sql)
        ) {
            st.setInt(
                1,
                id
            );
            st.setInt(
                2,
                matchID
            );
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    MatchStatistic m = new MatchStatistic();
                    m.setMatchStatisticID(rs.getInt("MatchStatisticID"));
                    m.setMatchID(rs.getInt("MatchID"));
                    m.setTeamID(rs.getInt("TeamID"));
                    m.setScore(rs.getInt("Score"));
                    m.setYellowCards(rs.getInt("YellowCards"));
                    m.setRedCards(rs.getInt("RedCards"));
                    m.setTotalShots(rs.getInt("TotalShots"));
                    m.setCornerKicks(rs.getInt("CornerKicks"));
                    m.setBallPossession(rs.getInt("BallPossession"));
                    m.setPasses(rs.getInt("Passes"));
                    return Optional.of(m);
                }
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
        return Optional.empty();
    }

    @Override
    public Optional<MatchStatistic> get(int id) {
        String sql = "SELECT [MatchStatisticID], [MatchID], [TeamID], [Score], [YellowCards], [RedCards], [TotalShots], [CornerKicks], [BallPossession], [Passes] FROM [dbo].[MatchStatistic] WHERE [MatchStatisticID] = ?";
        try (
            Connection con = openConnection();
            PreparedStatement st = con.prepareStatement(sql)
        ) {
            st.setInt(
                1,
                id
            );
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    MatchStatistic m = new MatchStatistic();
                    m.setMatchStatisticID(rs.getInt("MatchStatisticID"));
                    m.setMatchID(rs.getInt("MatchID"));
                    m.setTeamID(rs.getInt("TeamID"));
                    m.setScore(rs.getInt("Score"));
                    m.setYellowCards(rs.getInt("YellowCards"));
                    m.setRedCards(rs.getInt("RedCards"));
                    m.setTotalShots(rs.getInt("TotalShots"));
                    m.setCornerKicks(rs.getInt("CornerKicks"));
                    m.setBallPossession(rs.getInt("BallPossession"));
                    m.setPasses(rs.getInt("Passes"));
                    return Optional.of(m);
                }
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
        return Optional.empty();
    }

    public Optional<MatchStatistic> getByTeamIdAndMatchId(
        int tid,
        int mid
    ) {
        String sql = "SELECT [MatchStatisticID], [MatchID], [TeamID], [Score], [YellowCards], [RedCards], [TotalShots], [CornerKicks], [BallPossession], [Passes] FROM [dbo].[MatchStatistic]" + " WHERE  [TeamID] = ? and  [MatchID] = ?";
        try (
            Connection con = openConnection();
            PreparedStatement st = con.prepareStatement(sql)
        ) {
            st.setInt(
                1,
                tid
            );
            st.setInt(
                2,
                mid
            );
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    MatchStatistic m = new MatchStatistic();
                    m.setMatchStatisticID(rs.getInt("MatchStatisticID"));
                    m.setMatchID(rs.getInt("MatchID"));
                    m.setTeamID(rs.getInt("TeamID"));
                    m.setScore(rs.getInt("Score"));
                    m.setYellowCards(rs.getInt("YellowCards"));
                    m.setRedCards(rs.getInt("RedCards"));
                    m.setTotalShots(rs.getInt("TotalShots"));
                    m.setCornerKicks(rs.getInt("CornerKicks"));
                    m.setBallPossession(rs.getInt("BallPossession"));
                    m.setPasses(rs.getInt("Passes"));
                    return Optional.of(m);
                }
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
        return Optional.empty();
    }

    @Override
    public void save(MatchStatistic t) {
        String sql = "INSERT INTO [dbo].[MatchStatistic] ([MatchID], [TeamID], [Score], [YellowCards], [RedCards], [TotalShots], [CornerKicks], [BallPossession], [Passes]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (
            Connection con = openConnection();
            PreparedStatement st = con.prepareStatement(sql)
        ) {
            if (!canInsert(t.getMatchID())) {
                throw new SQLException("1 match is not contain over 2 team");
            }

            st.setInt(
                1,
                t.getMatchID()
            );
            st.setInt(
                2,
                t.getTeamID()
            );
            st.setInt(
                3,
                t.getScore()
            );
            st.setInt(
                4,
                t.getYellowCards()
            );
            st.setInt(
                5,
                t.getRedCards()
            );
            st.setInt(
                6,
                t.getTotalShots()
            );
            st.setInt(
                7,
                t.getCornerKicks()
            );
            st.setDouble(
                8,
                t.getBallPossession()
            );
            st.setInt(
                9,
                t.getPasses()
            );
            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(PlayerDAO.class.getName()).log(
                Level.SEVERE,
                null,
                e
            );
        } finally {
            closeResources();
        }
    }

    @Override
    public void update(MatchStatistic t) {
        String sql = "UPDATE [dbo].[MatchStatistic] SET [MatchID] = ?, [TeamID] = ?, [Score] = ?, [YellowCards] = ?, [RedCards] = ?, [TotalShots] = ?, [CornerKicks] = ?, [BallPossession] = ?, [Passes] = ? WHERE [MatchStatisticID] = ?";
        try (
            Connection con = openConnection();
            PreparedStatement st = con.prepareStatement(sql)
        ) {

            st.setInt(
                1,
                t.getMatchID()
            );
            st.setInt(
                2,
                t.getTeamID()
            );
            st.setInt(
                3,
                t.getScore()
            );
            st.setInt(
                4,
                t.getYellowCards()
            );
            st.setInt(
                5,
                t.getRedCards()
            );
            st.setInt(
                6,
                t.getTotalShots()
            );
            st.setInt(
                7,
                t.getCornerKicks()
            );
            st.setDouble(
                8,
                t.getBallPossession()
            );
            st.setInt(
                9,
                t.getPasses()
            );
            st.setInt(
                10,
                t.getMatchStatisticID()
            );
            st.executeUpdate();

        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(PlayerDAO.class.getName()).log(
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
        String sql = "DELETE FROM [dbo].[MatchStatistic] WHERE [MatchStatisticID] = ?";
        try (
            Connection con = openConnection();
            PreparedStatement st = con.prepareStatement(sql)
        ) {
            st.setInt(
                1,
                id
            );
            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(PlayerDAO.class.getName()).log(
                Level.SEVERE,
                null,
                e
            );
        } finally {
            closeResources();
        }
    }

    public List<MatchStatistic> GetByMatchID(int id) {
        String sql = "SELECT [MatchStatisticID], [MatchID], [TeamID], [Score], [YellowCards], [RedCards], [TotalShots], [CornerKicks], [BallPossession], [Passes] FROM [dbo].[MatchStatistic] WHERE [MatchID] = ?";
        try (
            Connection con = openConnection();
            PreparedStatement st = con.prepareStatement(sql)
        ) {
            List<MatchStatistic> mstList = new ArrayList<>();
            st.setInt(
                1,
                id
            );
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    MatchStatistic m = new MatchStatistic();
                    m.setMatchStatisticID(rs.getInt("MatchStatisticID"));
                    m.setMatchID(rs.getInt("MatchID"));
                    m.setTeamID(rs.getInt("TeamID"));
                    m.setScore(rs.getInt("Score"));
                    m.setYellowCards(rs.getInt("YellowCards"));
                    m.setRedCards(rs.getInt("RedCards"));
                    m.setTotalShots(rs.getInt("TotalShots"));
                    m.setCornerKicks(rs.getInt("CornerKicks"));
                    m.setBallPossession(rs.getInt("BallPossession"));
                    m.setPasses(rs.getInt("Passes"));
                    mstList.add(m);
                }
                return mstList;
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

    public boolean canInsert(int matchID) throws SQLException, ClassNotFoundException {
        sql = "SELECT COUNT( TeamID) AS teamCount FROM MatchStatistic WHERE MatchID = ?";
        try (
            Connection con = openConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(
                1,
                matchID
            );
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int teamCount = rs.getInt("teamCount");
                    return teamCount < 2;
                }
            }
        }
        return false;
    }

    public boolean canUpdate(int matchID) throws SQLException, ClassNotFoundException {
        sql = "SELECT COUNT( TeamID) AS teamCount FROM MatchStatistic WHERE MatchID = ?";
        try (
            Connection con = openConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(
                1,
                matchID
            );
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int teamCount = rs.getInt("teamCount");
                    return teamCount <= 2;
                }
            }
        }
        return false;
    }

}
