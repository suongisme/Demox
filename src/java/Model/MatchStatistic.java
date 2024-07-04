/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.io.Serializable;

/**
 * @author Desktop
 */
public class MatchStatistic implements Serializable {
    private int matchStatisticID;
    private int matchID;
    private int teamID;
    private int score;
    private int yellowCards;
    private int redCards;
    private int totalShots;
    private int cornerKicks;
    private double ballPossession;
    private int passes;

    public MatchStatistic() {
    }

    public MatchStatistic(
        int matchID,
        int teamID,
        int score,
        int yellowCards,
        int redCards,
        int totalShots,
        int cornerKicks,
        double ballPossession,
        int passes
    ) {
        this.matchID = matchID;
        this.teamID = teamID;
        this.score = score;
        this.yellowCards = yellowCards;
        this.redCards = redCards;
        this.totalShots = totalShots;
        this.cornerKicks = cornerKicks;
        this.ballPossession = ballPossession;
        this.passes = passes;
    }

    public MatchStatistic(
        int matchStatisticID,
        int matchID,
        int teamID,
        int score,
        int yellowCards,
        int redCards,
        int totalShots,
        int cornerKicks,
        double ballPossession,
        int passes
    ) {
        this.matchStatisticID = matchStatisticID;
        this.matchID = matchID;
        this.teamID = teamID;
        this.score = score;
        this.yellowCards = yellowCards;
        this.redCards = redCards;
        this.totalShots = totalShots;
        this.cornerKicks = cornerKicks;
        this.ballPossession = ballPossession;
        this.passes = passes;
    }

    public int getMatchStatisticID() {
        return matchStatisticID;
    }

    public void setMatchStatisticID(int matchStatisticID) {
        this.matchStatisticID = matchStatisticID;
    }

    public int getMatchID() {
        return matchID;
    }

    public void setMatchID(int matchID) {
        this.matchID = matchID;
    }

    public int getTeamID() {
        return teamID;
    }

    public void setTeamID(int teamID) {
        this.teamID = teamID;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getYellowCards() {
        return yellowCards;
    }

    public void setYellowCards(int yellowCards) {
        this.yellowCards = yellowCards;
    }

    public int getRedCards() {
        return redCards;
    }

    public void setRedCards(int redCards) {
        this.redCards = redCards;
    }

    public int getTotalShots() {
        return totalShots;
    }

    public void setTotalShots(int totalShots) {
        this.totalShots = totalShots;
    }

    public int getCornerKicks() {
        return cornerKicks;
    }

    public void setCornerKicks(int cornerKicks) {
        this.cornerKicks = cornerKicks;
    }

    public double getBallPossession() {
        return ballPossession;
    }

    public void setBallPossession(double ballPossession) {
        this.ballPossession = ballPossession;
    }

    public int getPasses() {
        return passes;
    }

    public void setPasses(int passes) {
        this.passes = passes;
    }

    @Override
    public String toString() {
        return "MatchStatistic{" + "matchStatisticID=" + matchStatisticID + ", matchID=" + matchID + ", teamID=" + teamID + ", score=" + score + ", yellowCards=" + yellowCards + ", redCards=" + redCards + ", totalShots=" + totalShots + ", cornerKicks=" + cornerKicks + ", ballPossession=" + ballPossession + ", passes=" + passes + '}';
    }


}
