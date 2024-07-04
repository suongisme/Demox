/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 * @author quangminh
 */
public class DietPlanDetail {

    int FoodID;
    String FoodName;
    String Description;
    int Calo;
    int Proteins;
    int Carbohydrates;
    int Fats;
    int portionSize;

    public DietPlanDetail(
        int FoodID,
        String FoodName,
        String Description,
        int Calo,
        int Proteins,
        int Carbohydrates,
        int Fats,
        int portionSize
    ) {
        this.FoodID = FoodID;
        this.FoodName = FoodName;
        this.Description = Description;
        this.Calo = Calo;
        this.Proteins = Proteins;
        this.Carbohydrates = Carbohydrates;
        this.Fats = Fats;
        this.portionSize = portionSize;
    }

    public int getFoodID() {
        return FoodID;
    }

    public void setFoodID(int FoodID) {
        this.FoodID = FoodID;
    }

    public String getFoodName() {
        return FoodName;
    }

    public void setFoodName(String FoodName) {
        this.FoodName = FoodName;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getCalo() {
        return Calo;
    }

    public void setCalo(int Calo) {
        this.Calo = Calo;
    }

    public int getProteins() {
        return Proteins;
    }

    public void setProteins(int Proteins) {
        this.Proteins = Proteins;
    }

    public int getCarbohydrates() {
        return Carbohydrates;
    }

    public void setCarbohydrates(int Carbohydrates) {
        this.Carbohydrates = Carbohydrates;
    }

    public int getFats() {
        return Fats;
    }

    public void setFats(int Fats) {
        this.Fats = Fats;
    }

    public int getPortionSize() {
        return portionSize;
    }

    public void setPortionSize(int portionSize) {
        this.portionSize = portionSize;
    }

}
