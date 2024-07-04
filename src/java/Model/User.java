/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import com.google.gson.annotations.SerializedName;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * @author Desktop
 */
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    private int userId;
    private String userName;
    private String image;
    private String password;
    private String email;
    private Role role;
    private String name;
    private transient LocalDate dateOfBirth;
    private String about;
    private boolean status;


    @SerializedName("dateOfBirth")
    private String dateOfBirthString;

    public User() {
    }

    public User(
        int userId,
        String userName,
        String password,
        String email,
        Role role
    ) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.role = role;
        this.status = true;
    }

    public User(
        String userName,
        String password,
        String email,
        Role role
    ) {
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.role = role;
        this.status = true;

    }

    public User(
        int userId,
        String userName,
        String image,
        String password,
        String email,
        Role role
    ) {
        this.userId = userId;
        this.userName = userName;
        this.image = image;
        this.password = password;
        this.email = email;
        this.role = role;
        this.status = true;
    }

    public User(
        String userName,
        String image,
        String password,
        String email,
        Role role
    ) {
        this.userName = userName;
        this.image = image;
        this.password = password;
        this.email = email;
        this.role = role;
        this.status = true;
    }

    public User(
        int userId,
        String userName,
        String image,
        String password,
        String email,
        Role role,
        String name,
        LocalDate dateOfBirth,
        String about
    ) {
        this.userId = userId;
        this.userName = userName;
        this.image = image;
        this.password = password;
        this.email = email;
        this.role = role;
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.about = about;
        this.status = true;
    }

    public User(
        String userName,
        String image,
        String password,
        String email,
        Role role,
        String name,
        LocalDate dateOfBirth,
        String about
    ) {
        this.userName = userName;
        this.image = image;
        this.password = password;
        this.email = email;
        this.role = role;
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.about = about;
        this.status = true;

    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
        this.dateOfBirthString = dateOfBirth.toString(); // Convert LocalDate to string for serialization
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    //    public LocalDate getDateOfBirth() {
    //        return dateOfBirth;
    //    }
    //
    //    public void setDateOfBirth(LocalDate dateOfBirth) {
    //        this.dateOfBirth = dateOfBirth;
    //    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public boolean getStatus() {
        return status;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", image=" + image + ", password=" + password + ", email=" + email + ", role=" + role + ", name=" + name + ", dateOfBirth=" + dateOfBirth + ", about=" + about + ", status=" + status + '}';
    }

}
