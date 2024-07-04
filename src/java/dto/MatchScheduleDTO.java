package dto;

import Model.Ticket;
import Model.TicketPurchase;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class MatchScheduleDTO {
    private int matchID;
    private Date matchDate;
    private String opponent;
    private String location;
    private int homeTeamID;
    private int awayTeamID;
    private List<Ticket> tickets;

    private String homeTeamName;
    private String awayTeamName;
    private Map<Integer, TicketPurchase> ticketPurchaseMap;

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
    }

    public String getOpponent() {
        return opponent;
    }

    public void setOpponent(String opponent) {
        this.opponent = opponent;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
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

    public String getHomeTeamName() {
        return homeTeamName;
    }

    public void setHomeTeamName(String homeTeamName) {
        this.homeTeamName = homeTeamName;
    }

    public String getAwayTeamName() {
        return awayTeamName;
    }

    public void setAwayTeamName(String awayTeamName) {
        this.awayTeamName = awayTeamName;
    }

    public List<Ticket> getTickets() {
        return tickets;
    }

    public void setTickets(List<Ticket> tickets) {
        this.tickets = tickets;
    }

    public Map<Integer, TicketPurchase> getTicketPurchaseMap() {
        return ticketPurchaseMap;
    }

    public void setTicketPurchaseMap(Map<Integer, TicketPurchase> ticketPurchaseMap) {
        this.ticketPurchaseMap = ticketPurchaseMap;
    }
}
