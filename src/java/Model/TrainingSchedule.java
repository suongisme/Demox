/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.time.LocalDate;

public class TrainingSchedule {

    private int TrainingID;
    private LocalDate TrainingDate;
    private String TrainingTime;
    private String Location;
    private String Description;

    // Constructors
    public TrainingSchedule() {
    }

    public TrainingSchedule(
        int TrainingID,
        LocalDate TrainingDate,
        String TrainingTime,
        String Location,
        String Description
    ) {
        this.TrainingID = TrainingID;
        this.TrainingDate = TrainingDate;
        this.TrainingTime = TrainingTime;
        this.Location = Location;
        this.Description = Description;
    }

    public TrainingSchedule(
        LocalDate TrainingDate,
        String TrainingTime,
        String Location,
        String Description
    ) {
        this.TrainingDate = TrainingDate;
        this.TrainingTime = TrainingTime;
        this.Location = Location;
        this.Description = Description;
    }

    public int getTrainingID() {
        return TrainingID;
    }

    public void setTrainingID(int TrainingID) {
        this.TrainingID = TrainingID;
    }

    public LocalDate getTrainingDate() {
        return TrainingDate;
    }

    public void setTrainingDate(LocalDate TrainingDate) {
        this.TrainingDate = TrainingDate;
    }

    public String getTrainingTime() {
        return TrainingTime;
    }

    public void setTrainingTime(String TrainingTime) {
        this.TrainingTime = TrainingTime;
    }

    public String getLocation() {
        return Location;
    }

    public void setLocation(String Location) {
        this.Location = Location;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    @Override
    public String toString() {
        return "TrainingSchedule{" + "TrainingID=" + TrainingID + ", TrainingDate=" + TrainingDate + ", TrainingTime=" + TrainingTime + ", Location=" + Location + ", Description=" + Description + '}';
    }


}
