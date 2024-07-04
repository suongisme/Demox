/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package Model;

import java.time.LocalDate;

/**
 * @author Zanis
 */
public class Meeting {

    int MeetingID;
    LocalDate MeetingDate;
    String MeetingTime;
    String Location;
    String Description;

    public Meeting() {
    }

    public Meeting(
        int MeetingID,
        LocalDate MeetingDate,
        String MeetingTime,
        String Location,
        String Description
    ) {
        this.MeetingID = MeetingID;
        this.MeetingDate = MeetingDate;
        this.MeetingTime = MeetingTime;
        this.Location = Location;
        this.Description = Description;
    }

    public Meeting(
        LocalDate MeetingDate,
        String MeetingTime,
        String Location,
        String Description
    ) {
        this.MeetingDate = MeetingDate;
        this.MeetingTime = MeetingTime;
        this.Location = Location;
        this.Description = Description;
    }


    public int getMeetingID() {
        return MeetingID;
    }

    public void setMeetingID(int MeetingID) {
        this.MeetingID = MeetingID;
    }

    public LocalDate getMeetingDate() {
        return MeetingDate;
    }

    public void setMeetingDate(LocalDate MeetingDate) {
        this.MeetingDate = MeetingDate;
    }

    public String getMeetingTime() {
        return MeetingTime;
    }

    public void setMeetingTime(String MeetingTime) {
        this.MeetingTime = MeetingTime;
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
        return "Meeting{" + "MeetingID=" + MeetingID + ", MeetingDate=" + MeetingDate + ", MeetingTime=" + MeetingTime + ", Location=" + Location + ", Description=" + Description + '}';
    }


}
