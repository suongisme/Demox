
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import com.google.gson.annotations.SerializedName;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * @author quangminh
 */
public class Player implements Serializable {

    private int playerID;
    private Integer userID;
    private Position position;
    private String name;
    private transient LocalDate age;
    private double weight;
    private int height;


    @SerializedName("age")
    private String ageString;

    private String image;


    public Player(
        Position position,
        String name,
        LocalDate age,
        double weight,
        int height
    ) {
        this.position = position;
        this.name = name;
        this.age = age;
        this.weight = weight;
        this.height = height;
    }

    public Player(
        int userID,
        Position position,
        String name,
        LocalDate age,
        double weight,
        int height
    ) {

        this.userID = userID;
        this.position = position;
        this.name = name;
        this.age = age;
        this.weight = weight;
        this.height = height;
    }

    // Constructor
    public Player(
        int playerID,
        int userID,
        Position position,
        String name,
        LocalDate age,
        double weight,
        int height
    ) {
        this.playerID = playerID;
        this.userID = userID;
        this.position = position;
        this.name = name;
        this.age = age;
        this.weight = weight;
        this.height = height;
        this.image = image;
    }


    public Player(
        int playerID,
        int userID,
        Position position,
        String name,
        LocalDate age,
        double weight,
        int height,
        String image
    ) {
        this.playerID = playerID;
        this.userID = userID;
        this.position = position;
        this.name = name;
        this.age = age;
        this.weight = weight;
        this.height = height;
        this.image = image;
    }

    // Default Constructor
    public Player() {
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    // Getters and Setters
    public int getPlayerID() {
        return playerID;
    }

    public void setPlayerID(int playerID) {
        this.playerID = playerID;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;

    }

    public LocalDate getAge() {
        return age;
    }

    public void setAge(LocalDate age) {
        this.age = age;
        this.ageString = age.toString();
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        if (weight < 0) {
            this.weight = 65;
        } else {
            this.weight = weight;
        }
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        if (height < 0) {
            this.height = 165;
        } else {
            this.height = height;
        }
    }

    @Override
    public String toString() {
        return "Player{" + "playerID=" + playerID + ", userID=" + userID + ", position=" + position + ", name=" + name + ", age=" + age + ", weight=" + weight + ", height=" + height + ", ageString=" + ageString + '}';
    }


}