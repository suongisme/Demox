package DAO;

import Model.Cart;
import dto.ExecutionDatabaseResult;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

public class CartDAO extends ConnectDbDao<Cart> {

    private static final String INSERT = "INSERT INTO Cart(UserId,Type,ItemId) VALUES(?, ?, ?)";
    private static final String INSERT_OR_UPDATE = """
        MERGE Cart WITH (SERIALIZABLE) AS T
        USING (VALUES(?, ?, ?)) as U (UserId, Type, ItemId)
            ON T.UserId = U.UserId AND T.ItemId = U.ItemId AND T.Type = U.Type
        WHEN MATCHED THEN
            UPDATE SET T.Quantity = T.Quantity + 1
        WHEN NOT MATCHED THEN
            INSERT (ItemId, Type, UserId, Quantity)
            VALUES (U.ItemId, U.Type, U.UserId, 1);
    """;

    @Override
    public List<Cart> getAll() {
        return null;
    }

    @Override
    public Optional<Cart> get(int id) {
        return Optional.empty();
    }

    @Override
    public void save(Cart cart) {
        final ExecutionDatabaseResult execute = this.execute(
            INSERT_OR_UPDATE,
            cart.getUserId(),
            cart.getType().name(),
            cart.getItemId()
        );
        if (Objects.nonNull(execute.getKey())) {
            cart.setId(execute.getKey().intValue());
        }
    }

    @Override
    public void update(Cart cart) {

    }

    @Override
    public void delete(int id) {

    }
}
