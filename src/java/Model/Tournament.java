/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Enum.java to edit this template
 */
package Model;

/**
 * @author Desktop
 */
public enum Tournament {
    PREMIER_LEAGUE("Premier League"),
    LA_LIGA("La Liga"),
    BUNDESLIGA("Bundesliga"),
    SERIE_A("Serie A"),
    LIGUE_1("Ligue 1"),
    CHAMPIONS_LEAGUE("Changepions League"),
    EUROPA_LEAGUE("Europa League"),
    Friendly("Freindly");

    Tournament(String value) {
        this.value = value;
    }

    private final String value;

    public String getValue() {
        return value;
    }
}
