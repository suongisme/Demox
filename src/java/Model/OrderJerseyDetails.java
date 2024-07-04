/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 * @author Desktop
 */
public class OrderJerseyDetails {


    private int orderDetailID;
    private int orderID;
    private int jerseySizeID;
    private int jerseyID;
    private int jerseyQuantity;

    // Constructor

    public OrderJerseyDetails(
        int orderDetailID,
        int orderID,
        int jerseySizeID,
        int jerseyID,
        int jerseyQuantity
    ) {
        this.orderDetailID = orderDetailID;
        this.orderID = orderID;
        this.jerseySizeID = jerseySizeID;
        this.jerseyID = jerseyID;
        this.jerseyQuantity = jerseyQuantity;
    }

    public OrderJerseyDetails(
        int orderID,
        int jerseySizeID,
        int jerseyID,
        int jerseyQuantity
    ) {
        this.orderID = orderID;
        this.jerseySizeID = jerseySizeID;
        this.jerseyID = jerseyID;
        this.jerseyQuantity = jerseyQuantity;
    }


    // Getters and Setters
    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getJerseySizeID() {
        return jerseySizeID;
    }

    public void setJerseySizeID(int jerseySizeID) {
        this.jerseySizeID = jerseySizeID;
    }

    public int getJerseyID() {
        return jerseyID;
    }

    public void setJerseyID(int jerseyID) {
        this.jerseyID = jerseyID;
    }

    public int getJerseyQuantity() {
        return jerseyQuantity;
    }

    public void setJerseyQuantity(int jerseyQuantity) {
        this.jerseyQuantity = jerseyQuantity;
    }

    // toString method (for debugging/logging purposes)
    @Override
    public String toString() {
        return "OrderDetail{" + "orderDetailID=" + orderDetailID + ", orderID=" + orderID + ", jerseySizeID=" + jerseySizeID + ", jerseyID=" + jerseyID + ", jerseyQuantity=" + jerseyQuantity + '}';
    }
}


