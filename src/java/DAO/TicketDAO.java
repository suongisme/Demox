package DAO;

import Model.Ticket;

import java.util.List;
import java.util.Optional;

public class TicketDAO extends ConnectDbDao<Ticket> {

    @Override
    public List<Ticket> getAll() {
        return this.query(
            "SELECT * FROM Ticket",
            Ticket::mappingDb
        );
    }

    @Override
    public Optional<Ticket> get(int id) {
        return this.queryOne(
            "SELECT * FROM Ticket WHERE TicketID = ?",
            Ticket::mappingDb,
            id
        );
    }

    @Override
    public void save(Ticket ticket) {

    }

    @Override
    public void update(Ticket ticket) {

    }

    @Override
    public void delete(int id) {

    }
}
