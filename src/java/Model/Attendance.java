/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package Model;

import java.time.LocalDate;

/**
 * @author Zanis
 */
public class Attendance {

    LocalDate CheckDate;
    boolean IsPresent;
    private int AttendanceID;
    private int PlayerID;
    private int TrainingID;

    public Attendance() {
    }


    public Attendance(
        int AttendanceID,
        int PlayerID,
        int TrainingID,
        LocalDate CheckDate,
        boolean IsPresent
    ) {
        this.AttendanceID = AttendanceID;
        this.PlayerID = PlayerID;
        this.TrainingID = TrainingID;
        this.CheckDate = CheckDate;
        this.IsPresent = IsPresent;
    }

    public Attendance(
        int PlayerID,
        int TrainingID,
        LocalDate CheckDate,
        boolean IsPresent
    ) {
        this.PlayerID = PlayerID;
        this.TrainingID = TrainingID;
        this.CheckDate = CheckDate;
        this.IsPresent = IsPresent;
    }


    public int getAttendanceID() {
        return AttendanceID;
    }

    public void setAttendanceID(int AttendanceID) {
        this.AttendanceID = AttendanceID;
    }

    public int getPlayerID() {
        return PlayerID;
    }

    public void setPlayerID(int PlayerID) {
        this.PlayerID = PlayerID;
    }

    public int getTrainingID() {
        return TrainingID;
    }

    public void setTrainingID(int TrainingID) {
        this.TrainingID = TrainingID;
    }

    public LocalDate getCheckDate() {
        return CheckDate;
    }

    public void setCheckDate(LocalDate CheckDate) {
        this.CheckDate = CheckDate;
    }

    public boolean isIsPresent() {
        return IsPresent;
    }

    public void setIsPresent(boolean IsPresent) {
        this.IsPresent = IsPresent;
    }

    @Override
    public String toString() {
        return "Attendance{" + "AttendanceID=" + AttendanceID + ", PlayerID=" + PlayerID + ", TrainingID=" + TrainingID + ", CheckDate=" + CheckDate + ", IsPresent=" + IsPresent + '}';
    }


}
