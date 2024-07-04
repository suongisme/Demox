/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.io.Serializable;

/**
 * @author Desktop
 */
public class Jersey implements Serializable {
    private int jerseyID;
    private String jerseyName;
    private String jerseyDescription;
    private double jerseyPrice;
    private String jerseyImage;

    public Jersey() {
    }


    public Jersey(
        int jerseyID,
        String jerseyName,
        String jerseyDescription,
        double jerseyPrice,
        String jerseyImage
    ) {
        this.jerseyID = jerseyID;
        this.jerseyName = jerseyName;
        this.jerseyDescription = jerseyDescription;
        this.jerseyPrice = jerseyPrice;
        this.jerseyImage = jerseyImage;
    }

    public Jersey(
        String jerseyName,
        String jerseyDescription,
        double jerseyPrice,
        String jerseyImage
    ) {
        this.jerseyName = jerseyName;
        this.jerseyDescription = jerseyDescription;
        this.jerseyPrice = jerseyPrice;
        this.jerseyImage = jerseyImage;
    }


    public int getJerseyID() {
        return jerseyID;
    }

    public void setJerseyID(int jerseyID) {
        this.jerseyID = jerseyID;
    }

    public String getJerseyName() {
        return jerseyName;
    }

    public void setJerseyName(String jerseyName) {
        this.jerseyName = jerseyName;
    }

    public String getJerseyDescription() {
        return jerseyDescription;
    }

    public void setJerseyDescription(String jerseyDescription) {
        this.jerseyDescription = jerseyDescription;
    }

    public double getJerseyPrice() {
        return jerseyPrice;
    }

    public void setJerseyPrice(double jerseyPrice) {
        this.jerseyPrice = jerseyPrice;
    }

    public String getJerseyImage() {
        return jerseyImage;
    }

    public void setJerseyImage(String jerseyImage) {
        this.jerseyImage = jerseyImage;
    }

    // toString method
    @Override
    public String toString() {
        return "Jersey{" + "jerseyID=" + jerseyID + ", jerseyName='" + jerseyName + '\'' + ", jerseyDescription='" + jerseyDescription + '\'' + ", jerseyPrice=" + jerseyPrice + ", jerseyImage='" + jerseyImage + '\'' + '}';
    }
}
