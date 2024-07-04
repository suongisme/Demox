/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 * @author quangminh
 */
public class DietPlans {

    int DietPlanID;
    int PlayerID;
    String PlanDescription;

    public DietPlans(
        int DietPlanID,
        int PlayerID,
        String PlanDescription
    ) {
        this.DietPlanID = DietPlanID;
        this.PlayerID = PlayerID;
        this.PlanDescription = PlanDescription;
    }

    public int getDietPlanID() {
        return DietPlanID;
    }

    public void setDietPlanID(int DietPlanID) {
        this.DietPlanID = DietPlanID;
    }

    public int getPlayerID() {
        return PlayerID;
    }

    public void setPlayerID(int PlayerID) {
        this.PlayerID = PlayerID;
    }

    public String getPlanDescription() {
        return PlanDescription;
    }

    public void setPlanDescription(String PlanDescription) {
        this.PlanDescription = PlanDescription;
    }

}
