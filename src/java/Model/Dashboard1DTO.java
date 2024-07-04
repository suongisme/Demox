/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 * @author quangminh
 */
public class Dashboard1DTO {
    int totalGoals;
    int totalRed;
    int totalYellow;

    public Dashboard1DTO(
        int totalGoals,
        int totalRed,
        int totalYellow
    ) {
        this.totalGoals = totalGoals;
        this.totalRed = totalRed;
        this.totalYellow = totalYellow;
    }

    public int getTotalGoals() {
        return totalGoals;
    }

    public void setTotalGoals(int totalGoals) {
        this.totalGoals = totalGoals;
    }

    public int getTotalRed() {
        return totalRed;
    }

    public void setTotalRed(int totalRed) {
        this.totalRed = totalRed;
    }

    public int getTotalYellow() {
        return totalYellow;
    }

    public void setTotalYellow(int totalYellow) {
        this.totalYellow = totalYellow;
    }


}
