package DAO;

import Model.TicketPurchase;
import dto.ExecutionDatabaseResult;

import java.sql.Date;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

public class TicketPurchaseDAO extends ConnectDbDao<TicketPurchase> {

    @Override
    public List<TicketPurchase> getAll() {
        return this.query(
            "SELECT * FROM TicketPurchase",
            TicketPurchase::mappingDb
        );
    }

    @Override
    public Optional<TicketPurchase> get(int id) {
        return Optional.empty();
    }

    @Override
    public void save(TicketPurchase ticketPurchase) {
        final ExecutionDatabaseResult execute = this.execute(
            "INSERT INTO TicketPurchase(UserId, TicketId, PurchaseDate, status, PaymentMethod) VALUES(?, ?, ?, ?, ?)",
            ticketPurchase.getUserId(),
            ticketPurchase.getTicketID(),
            new Date(ticketPurchase.getPurchaseDate().getTime()),
            ticketPurchase.getStatus(),
            ticketPurchase.getPaymentMethod()
        );
        if (Objects.nonNull(execute.getKey())) {
            ticketPurchase.setPurchaseID(execute.getKey().intValue());
        }
    }

    @Override
    public void update(TicketPurchase ticketPurchase) {

    }

    @Override
    public void delete(int id) {
        this.execute(
            "DELETE FROM TicketPurchase WHERE PurchaseID = ?",
            id
        );
    }

    public List<TicketPurchase> getProcessingPurchase() {
        return this.query(
            "SELECT * FROM TicketPurchase WHERE status = 0",
            TicketPurchase::mappingDb
        );
    }

    public int[] updateBatch(List<TicketPurchase> ticketPurchases) {
        return this.executeBatch(
            "UPDATE TicketPurchase SET status = ? WHERE PurchaseID = ?",
            ticketPurchases,
            (ticketPurchase) -> new Object[]{
                ticketPurchase.getStatus(),
                ticketPurchase.getPurchaseID()
            }
        );
    }

    public int[] deleteBatch(List<Integer> ids) {
        return this.executeBatch(
            "DELETE FROM TicketPurchase WHERE PurchaseID IN ?",
            ids,
            id -> new Object[]{id}
        );
    }
}
