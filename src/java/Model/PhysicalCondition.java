/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 * @author quangminh
 */
public class PhysicalCondition {

    int ConditionID;
    int PlayerID;
    String ConditionDescription;
    Date DateRecorded;

    public PhysicalCondition(
        int ConditionID,
        int PlayerID,
        String ConditionDescription,
        Date DateRecorded
    ) {
        this.ConditionID = ConditionID;
        this.PlayerID = PlayerID;
        this.ConditionDescription = ConditionDescription;
        this.DateRecorded = DateRecorded;
    }

    public int getConditionID() {
        return ConditionID;
    }

    public void setConditionID(int ConditionID) {
        this.ConditionID = ConditionID;
    }

    public int getPlayerID() {
        return PlayerID;
    }

    public void setPlayerID(int PlayerID) {
        this.PlayerID = PlayerID;
    }

    public String getConditionDescription() {
        return ConditionDescription;
    }

    public void setConditionDescription(String ConditionDescription) {
        this.ConditionDescription = ConditionDescription;
    }

    public Date getDateRecorded() {
        return DateRecorded;
    }

    public void setDateRecorded(Date DateRecorded) {
        this.DateRecorded = DateRecorded;
    }

}
