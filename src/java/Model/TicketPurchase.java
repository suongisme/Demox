package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class TicketPurchase {
    private Integer purchaseID;
    private Integer userId;
    private Integer ticketID;
    private Date purchaseDate;
    private Integer status;
    private String paymentMethod;

    public static TicketPurchase mappingDb(ResultSet resultSet) throws SQLException {
        TicketPurchase ticketPurchase = new TicketPurchase();
        ticketPurchase.setUserId(resultSet.getInt("UserID"));
        ticketPurchase.setPaymentMethod(resultSet.getString("PaymentMethod"));
        ticketPurchase.setTicketID(resultSet.getInt("TicketID"));
        ticketPurchase.setPurchaseDate(resultSet.getDate("PurchaseDate"));
        ticketPurchase.setPurchaseID(resultSet.getInt("PurchaseID"));
        ticketPurchase.setStatus(resultSet.getInt("status"));
        return ticketPurchase;
    }

    public Integer getPurchaseID() {
        return purchaseID;
    }

    public void setPurchaseID(Integer purchaseID) {
        this.purchaseID = purchaseID;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getTicketID() {
        return ticketID;
    }

    public void setTicketID(Integer ticketID) {
        this.ticketID = ticketID;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
}
