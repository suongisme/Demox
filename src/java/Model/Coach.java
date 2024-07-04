package Model;

import java.io.Serializable;

/**
 * @author Desktop
 */
public class Coach implements Serializable {

    private static final long serialVersionUID = 1L;

    private int coachID;
    private int userID;
    private String coachName;

    public Coach() {
    }

    public Coach(
        int coachID,
        int userID,
        String coachName
    ) {
        this.coachID = coachID;
        this.userID = userID;
        this.coachName = coachName;
    }

    public int getCoachID() {
        return coachID;
    }

    public void setCoachID(int coachID) {
        this.coachID = coachID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getCoachName() {
        return coachName;
    }

    public void setCoachName(String coachName) {
        this.coachName = coachName;
    }

    @Override
    public String toString() {
        return "Coach{" + "coachID=" + coachID + ", userID=" + userID + ", coachName=" + coachName + '}';
    }
}