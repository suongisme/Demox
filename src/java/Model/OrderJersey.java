package Model;

import java.time.LocalDate;

public class OrderJersey {
    private int orderID;
    private int userID;
    private LocalDate orderDate;
    private double orderTotal;
    private String phone;
    private String address;

    // Constructors
    public OrderJersey() {
        this.orderDate = LocalDate.now();
    }

    public OrderJersey(
        int orderID,
        int userID,
        double orderTotal,
        String phone,
        String address
    ) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = LocalDate.now();
        this.orderTotal = orderTotal;
        this.phone = phone;
        this.address = address;
    }

    public OrderJersey(
        int orderID,
        int userID,
        LocalDate orderDate,
        double orderTotal,
        String phone,
        String address
    ) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = orderDate;
        this.orderTotal = orderTotal;
        this.phone = phone;
        this.address = address;
    }

    // Getters and Setters
    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public LocalDate getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDate orderDate) {
        this.orderDate = orderDate;
    }

    public double getOrderTotal() {
        return orderTotal;
    }

    public void setOrderTotal(double orderTotal) {
        this.orderTotal = orderTotal;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    // toString method
    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", userID=" + userID + ", orderDate=" + orderDate + ", orderTotal=" + orderTotal + ", phone='" + phone + '\'' + ", address='" + address + '\'' + '}';
    }
}
