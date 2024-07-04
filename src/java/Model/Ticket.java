package Model;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Ticket {
    private Integer ticketId;
    private Integer matchId;
    private String seatNumber;
    private BigDecimal price;

    public static Ticket mappingDb(ResultSet resultSet) throws SQLException {
        Ticket ticket = new Ticket();
        ticket.setTicketId(resultSet.getInt("TicketID"));
        ticket.setMatchId(resultSet.getInt("MatchID"));
        ticket.setPrice(resultSet.getBigDecimal("Price"));
        ticket.setSeatNumber(resultSet.getString("SeatNumber"));
        return ticket;
    }

    public Integer getTicketId() {
        return ticketId;
    }

    public void setTicketId(Integer ticketId) {
        this.ticketId = ticketId;
    }

    public Integer getMatchId() {
        return matchId;
    }

    public void setMatchId(Integer matchId) {
        this.matchId = matchId;
    }

    public String getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(String seatNumber) {
        this.seatNumber = seatNumber;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}
