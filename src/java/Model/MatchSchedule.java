package Model;

import com.google.gson.annotations.SerializedName;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

public class MatchSchedule implements Serializable {
    private static final long serialVersionUID = 1L;

    private int matchID;
    private transient Date matchDate;
    private String matchLocation; // Changed from MatchLocation to matchLocation
    private int homeTeamID;
    private int awayTeamID;
    private Tournament tournament;
    private Team homeTeam;
    private Team awayTeam;
    private MatchStatistic matchHomeTeam;
    private MatchStatistic matchAwayTeam;
    @SerializedName("matchDate")
    private String matchDateString;

    public MatchSchedule() {
    }

    public MatchSchedule(
        int matchID,
        Date matchDate,
        String matchLocation,
        int homeTeamID,
        int awayTeamID,
        Tournament tournament,
        Team homeTeam,
        Team awayTeam,
        String matchDateString
    ) {
        this.matchID = matchID;
        this.matchDate = matchDate;
        this.matchLocation = matchLocation; // Changed from MatchLocation to matchLocation
        this.homeTeamID = homeTeamID;
        this.awayTeamID = awayTeamID;
        this.tournament = tournament;
        this.awayTeam = awayTeam;
        this.matchDateString = matchDateString;
    }

    public MatchSchedule(
        int matchID,
        Date matchDate,
        String matchLocation,
        int homeTeamID,
        int awayTeamID,
        Tournament tournament
    ) {
        this.matchID = matchID;
        this.matchDate = matchDate;
        this.matchLocation = matchLocation; // Changed from MatchLocation to matchLocation
        this.homeTeamID = homeTeamID;
        this.awayTeamID = awayTeamID;
        this.tournament = tournament;
    }

    public MatchSchedule(
        Date matchDate,
        String matchLocation,
        int homeTeamID,
        int awayTeamID,
        Tournament tournament
    ) {
        this.matchDate = matchDate;
        this.matchLocation = matchLocation; // Changed from MatchLocation to matchLocation
        this.homeTeamID = homeTeamID;
        this.awayTeamID = awayTeamID;
        this.tournament = tournament;
    }

    public MatchSchedule(
        int matchID,
        Date matchDate,
        String matchLocation,
        int homeTeamID,
        int awayTeamID
    ) {
        this.matchID = matchID;
        this.matchDate = matchDate;
        this.matchLocation = matchLocation; // Changed from MatchLocation to matchLocation
        this.homeTeamID = homeTeamID;
        this.awayTeamID = awayTeamID;
    }

    public MatchStatistic getMatchHomeTeam() {
        return matchHomeTeam;
    }

    public void setMatchHomeTeam(MatchStatistic matchHomeTeam) {
        this.matchHomeTeam = matchHomeTeam;
    }

    public MatchStatistic getMatchAwayTeam() {
        return matchAwayTeam;
    }

    public void setMatchAwayTeam(MatchStatistic matchAwayTeam) {
        this.matchAwayTeam = matchAwayTeam;
    }

    public int getMatchID() {
        return matchID;
    }

    public void setMatchID(int matchID) {
        this.matchID = matchID;
    }

    public Date getMatchDate() {
        return matchDate;
    }

    public void setMatchDate(Date matchDate) {
        this.matchDate = matchDate;
        this.matchDateString = matchDate.toString();
    }

    public Team getHomeTeam() {
        return homeTeam;
    }

    public void setHomeTeam(Team homeTeam) {
        this.homeTeam = homeTeam;
    }

    public Team getAwayTeam() {
        return awayTeam;
    }

    public void setAwayTeam(Team awayTeam) {
        this.awayTeam = awayTeam;
    }

    public String getMatchLocation() {
        return matchLocation; // Changed from MatchLocation to matchLocation
    }

    public void setMatchLocation(String matchLocation) {
        this.matchLocation = matchLocation; // Changed from MatchLocation to matchLocation
    }

    public int getHomeTeamID() {
        return homeTeamID;
    }

    public void setHomeTeamID(int homeTeamID) {
        this.homeTeamID = homeTeamID;
    }

    public int getAwayTeamID() {
        return awayTeamID;
    }

    public void setAwayTeamID(int awayTeamID) {
        this.awayTeamID = awayTeamID;
    }

    public Tournament getTournament() {
        return tournament;
    }

    public void setTournament(Tournament tournament) {
        this.tournament = tournament;
    }

    @Override
    public String toString() {
        return "MatchSchedule{" + "matchID=" + matchID + ", matchDate=" + matchDate + ", matchLocation='" + matchLocation + '\'' + // Changed from MatchLocation to matchLocation
            ", homeTeamID=" + homeTeamID + ", awayTeamID=" + awayTeamID + ", tournament=" + tournament + ", matchDateString='" + matchDateString + '\'' + '}';
    }

    public static MatchSchedule mappingDb(ResultSet rs) throws SQLException {
        MatchSchedule m = new MatchSchedule();
        m.setMatchID(rs.getInt(1));
        m.setAwayTeamID(rs.getInt(2));
        m.setHomeTeamID(rs.getInt(3));
        Timestamp sqlDate = rs.getTimestamp(4);
        if (sqlDate != null) {
            m.setMatchDate(sqlDate);
        }
        m.setMatchLocation(rs.getString(5));
        String tour = rs.getString(6);
        if (tour != null) {
            m.setTournament(Tournament.valueOf(tour.trim()));
        }
        return m;
    }
}
