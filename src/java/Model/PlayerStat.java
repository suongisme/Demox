/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.time.LocalDate;

/**
 * @author quangminh
 */
public class PlayerStat {
    private int playerId;
    private LocalDate date;
    private int goalsScored;
    private int assists;
    private int yellowCards;
    private int redCards;

    public PlayerStat(
        int playerId,
        LocalDate date,
        int goalsScored,
        int assists,
        int yellowCards,
        int redCards
    ) {
        this.playerId = playerId;
        this.date = date;
        this.goalsScored = goalsScored;
        this.assists = assists;
        this.yellowCards = yellowCards;
        this.redCards = redCards;
    }

    public int getPlayerId() {
        return playerId;
    }

    public void setPlayerId(int playerId) {
        this.playerId = playerId;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public int getGoalsScored() {
        return goalsScored;
    }

    public void setGoalsScored(int goalsScored) {
        this.goalsScored = goalsScored;
    }

    public int getAssists() {
        return assists;
    }

    public void setAssists(int assists) {
        this.assists = assists;
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

    @Override
    public String toString() {
        return "PlayerStat{" + "playerId=" + playerId + ", date=" + date + ", goalsScored=" + goalsScored + ", assists=" + assists + ", yellowCards=" + yellowCards + ", redCards=" + redCards + '}';
    }
}
