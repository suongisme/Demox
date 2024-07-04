/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.io.Serializable;

/**
 * @author Desktop
 */
public class JerseySize implements Serializable {

    private int sizeID;
    private int jerseyID;
    private JerseySizeEnum jerseySize;
    private int jerseyQuantity;

    // Constructors
    public JerseySize() {
        // Default constructor
    }

    public JerseySize(
        int sizeID,
        int jerseyID,
        JerseySizeEnum jerseySize,
        int jerseyQuantity
    ) {
        this.sizeID = sizeID;
        this.jerseyID = jerseyID;
        this.jerseySize = jerseySize;
        this.jerseyQuantity = jerseyQuantity;
    }

    public JerseySize(
        int jerseyID,
        JerseySizeEnum jerseySize,
        int jerseyQuantity
    ) {
        this.jerseyID = jerseyID;
        this.jerseySize = jerseySize;
        this.jerseyQuantity = jerseyQuantity;
    }

    // Getters and Setters
    public int getSizeID() {
        return sizeID;
    }

    public void setSizeID(int sizeID) {
        this.sizeID = sizeID;
    }

    public int getJerseyID() {
        return jerseyID;
    }

    public void setJerseyID(int jerseyID) {
        this.jerseyID = jerseyID;
    }

    public JerseySizeEnum getJerseySize() {
        return jerseySize;
    }

    public void setJerseySize(JerseySizeEnum jerseySize) {
        this.jerseySize = jerseySize;
    }

    public int getJerseyQuantity() {
        return jerseyQuantity;
    }

    public void setJerseyQuantity(int jerseyQuantity) {
        this.jerseyQuantity = jerseyQuantity;
    }

    // toString method
    @Override
    public String toString() {
        return "JerseySize{" + "sizeID=" + sizeID + ", jerseyID=" + jerseyID + ", jerseySize=" + jerseySize + ", jerseyQuantity=" + jerseyQuantity + '}';
    }
}


