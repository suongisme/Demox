package Model;

import com.google.gson.annotations.SerializedName;

import java.io.Serializable;
import java.time.LocalDate;

public class MatchSchedule implements Serializable {
    private static final long serialVersionUID = 1L;

    private int matchID;
    private transient LocalDate matchDate;
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
        LocalDate matchDate,
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
        LocalDate matchDate,
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
        LocalDate matchDate,
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
        LocalDate matchDate,
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

    public LocalDate getMatchDate() {
        return matchDate;
    }

    public void setMatchDate(LocalDate matchDate) {
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

    public void setLocation(String location) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
