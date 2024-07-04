/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.io.Serializable;

/**
 * @author Desktop
 */
public class Team implements Serializable {
    private int teamID;
    private String teamName;
    private String flag;

    public Team(
        int teamID,
        String teamName,
        String flag
    ) {
        this.teamID = teamID;
        this.teamName = teamName;
        this.flag = flag;
    }

    public Team() {
    }

    public Team(
        int teamID,
        String teamName
    ) {
        this.teamID = teamID;
        this.teamName = teamName;
    }


    public Team(String teamName) {
        this.teamName = teamName;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public int getTeamID() {
        return teamID;
    }

    public void setTeamID(int teamID) {
        this.teamID = teamID;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    @Override
    public String toString() {
        return "Team{" + "teamID=" + teamID + ", teamName=" + teamName + '}';
    }


}
