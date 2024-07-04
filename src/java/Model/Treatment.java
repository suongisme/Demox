/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 * @author quangminh
 */
public class Treatment {

    int TreatmentID;
    int PlayerID;
    String TreatmentDate;
    String TreatmentTime;
    String TreatmentDescription;

    public Treatment(
        int TreatmentID,
        int PlayerID,
        String TreatmentDate,
        String TreatmentTime,
        String TreatmentDescription
    ) {
        this.TreatmentID = TreatmentID;
        this.PlayerID = PlayerID;
        this.TreatmentDate = TreatmentDate;
        this.TreatmentTime = TreatmentTime;
        this.TreatmentDescription = TreatmentDescription;
    }

    public int getTreatmentID() {
        return TreatmentID;
    }

    public void setTreatmentID(int TreatmentID) {
        this.TreatmentID = TreatmentID;
    }

    public int getPlayerID() {
        return PlayerID;
    }

    public void setPlayerID(int PlayerID) {
        this.PlayerID = PlayerID;
    }

    public String getTreatmentDate() {
        return TreatmentDate;
    }

    public void setTreatmentDate(String TreatmentDate) {
        this.TreatmentDate = TreatmentDate;
    }

    public String getTreatmentTime() {
        return TreatmentTime;
    }

    public void setTreatmentTime(String TreatmentTime) {
        this.TreatmentTime = TreatmentTime;
    }

    public String getTreatmentDescription() {
        return TreatmentDescription;
    }

    public void setTreatmentDescription(String TreatmentDescription) {
        this.TreatmentDescription = TreatmentDescription;
    }

}
