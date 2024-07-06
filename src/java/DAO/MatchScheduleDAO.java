/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.MatchSchedule;
import Model.Tournament;
import dto.ExecutionDatabaseResult;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

/**
 * @author Desktop
 */
public class MatchScheduleDAO extends ConnectDbDao<MatchSchedule> {

    public List<MatchSchedule> getMatchAlreadyStatistic() {
        return this.query(
            """
                    SELECT ms.MatchID, ms.AwayTeamID, ms.HomeTeamID, ms.MatchDate, ms.MatchLocation, ms.Tournament
                    FROM MatchSchedule ms
                        LEFT JOIN (
                            SELECT MatchID, COUNT(*) AS StatisticCount
                            FROM MatchStatistic
                            GROUP BY MatchID
                        ) msd ON ms.MatchID = msd.MatchID
                    WHERE msd.MatchID IS NOT NULL OR msd.StatisticCount >= 1
                """,
            MatchSchedule::mappingDb
        );
    }

    public List<MatchSchedule> getMatchHaveNotStatistic() {
        return this.query(
            """
                    SELECT ms.MatchID, ms.AwayTeamID, ms.HomeTeamID, ms.MatchDate, ms.MatchLocation, ms.Tournament
                    FROM MatchSchedule ms
                        LEFT JOIN (
                            SELECT MatchID, COUNT(*) AS StatisticCount
                            FROM MatchStatistic
                            GROUP BY MatchID
                        ) msd ON ms.MatchID = msd.MatchID
                    WHERE (msd.MatchID IS NULL OR msd.StatisticCount < 2) AND ms.MatchDate < GETDATE()
                """,
            MatchSchedule::mappingDb
        );
    }

    @Override
    public List<MatchSchedule> getAll() {
        return this.query(
            """
                    SELECT MatchID, AwayTeamID, HomeTeamID, MatchDate, MatchLocation, Tournament
                    FROM MatchSchedule
                """,
            MatchSchedule::mappingDb
        );
    }

    @Override
    public Optional<MatchSchedule> get(int id) {
        return this.queryOne(
            """
                SELECT MatchID, AwayTeamID, HomeTeamID, MatchDate, MatchLocation, Tournament
                FROM MatchSchedule
                WHERE MatchID = ?
                """,
            MatchSchedule::mappingDb
        );
    }

    @Override
    public void save(MatchSchedule t) {
        this.execute(
            "INSERT INTO MatchSchedule (AwayTeamID, HomeTeamID, MatchDate, MatchLocation, Tournament) VALUES (?, ?, " +
                "?, ?, ?)",
            t.getAwayTeamID(),
            t.getHomeTeamID(),
            new Date(t.getMatchDate().getTime()),
            t.getMatchLocation(),
            t.getTournament().name()
        );
    }

    @Override
    public void update(MatchSchedule t) {
        this.execute(
            "UPDATE MatchSchedule SET AwayTeamID = ?, HomeTeamID = ?, MatchDate = ?, MatchLocation = ?, " +
                "Tournament = ? WHERE MatchID = ?",
            t.getAwayTeamID(),
            t.getHomeTeamID(),
            new Date(t.getMatchDate().getTime()),
            t.getTournament().name(),
            t.getMatchID()
        );
    }

    @Override
    public void delete(int id) {
        this.execute(
            "DELETE FROM MatchSchedule WHERE MatchId = ?",
            id
        );
    }

    public Boolean deleteB(int id) {
        final ExecutionDatabaseResult execute = this.execute(
            "DELETE FROM MatchSchedule WHERE MatchId = ?",
            id
        );
        return execute.getRows() > 0;
    }

    public void add(MatchSchedule match) {
        this.execute(
            "INSERT INTO MatchSchedule (AwayTeamID, HomeTeamID, MatchDate, MatchLocation, Tournament) VALUES" + "(?, "
                + "?, ?, ?, ?)",
            match.getAwayTeamID(),
            match.getHomeTeamID(),
            new Date(match.getMatchDate().getTime()),
            match.getMatchLocation(),
            match.getTournament().name()
        );
    }

    public List<MatchSchedule> SearchMatch(String valueSearch) {
        String searchValue = "%" + valueSearch + "%";
        return this.query(
            """
                    SELECT
                        m.MatchID, m.MatchDate, m.MatchLocation, m.Tournament, t1.TeamID AS HomeTeamID,
                        t2.TeamID AS AwayTeamID, t1.TeamName AS HomeTeam, t2.TeamName AS AwayTeam
                    FROM MatchSchedule m
                        LEFT JOIN Teams t1 ON t1.TeamID = m.HomeTeamID
                        LEFT JOIN Teams t2 ON t2.TeamID = m.AwayTeamID
                    WHERE t1.TeamName LIKE ?
                        OR t2.TeamName LIKE ?
                        OR m.Tournament LIKE ?
                        OR m.MatchDate LIKE ?
                        OR m.MatchLocation LIKE ?
                        OR m.MatchID LIKE ?
                """,
            rs -> {
                MatchSchedule m = new MatchSchedule();
                m.setMatchID(rs.getInt("MatchID"));
                m.setAwayTeamID(rs.getInt("AwayTeamID"));
                m.setHomeTeamID(rs.getInt("HomeTeamID"));
                Timestamp sqlDate = rs.getTimestamp("MatchDate");
                if (sqlDate != null) {
                    m.setMatchDate(sqlDate);
                }
                m.setMatchLocation(rs.getString("MatchLocation"));
                String tour = rs.getString("Tournament");
                if (tour != null) {
                    m.setTournament(Tournament.valueOf(tour.trim()));
                }
                return m;
            },
            searchValue,
            searchValue,
            searchValue,
            searchValue,
            searchValue,
            searchValue
        );
    }
}
