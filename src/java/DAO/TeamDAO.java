/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Team;

import java.util.List;
import java.util.Optional;

/**
 * @author Desktop
 */
public class TeamDAO extends ConnectDbDao<Team> {

    @Override
    public List<Team> getAll() {
        return this.query("SELECT * FROM Teams", rs -> {
            Team t = new Team();
            t.setTeamID(rs.getInt("TeamID"));
            t.setTeamName(rs.getString("TeamName"));
            t.setFlag(rs.getString("flag"));
            return t;
        });
    }

    @Override
    public Optional<Team> get(int id) {
        return this.queryOne(
            "SELECT * FROM Teams",
            rs -> {
                Team t = new Team();
                t.setTeamID(rs.getInt("TeamID"));
                t.setTeamName(rs.getString("TeamName"));
                t.setFlag(rs.getString("flag"));
                return t;
            },
            id
        );
    }

    @Override
    public void save(Team t) {
        this.execute(
            "INSERT INT Teams(TeamName) VALUES(?)",
            t.getTeamName()
        );
    }

    @Override
    public void update(Team t) {
        this.execute(
            "UPDATE Teams SET TeamName = ? WHERE TeamID = ?",
            t.getTeamName(),
            t.getTeamID()
        );
    }

    @Override
    public void delete(int id) {
        this.execute("DELETE FROM Teams WHERE TeamId = ?", id);
    }
}
