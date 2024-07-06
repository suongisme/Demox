package DAO;

import Model.Cart;
import dto.ExecutionDatabaseResult;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import java.util.*;
import java.util.stream.Collectors;

public class CartDAO extends ConnectDbDao<Cart> {

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

    private static final String FIND_BY_USER_ID = "SELECT * FROM Cart WHERE UserId = ?";

    @Override
    public List<Cart> getAll() {
        return null;
    }

    @Override
    public Optional<Cart> get(int id) {
        return this.queryOne(
            "SELECT * FROM Cart WHERE Id = ?",
            Cart::mappingDb,
            id
        );
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
    public void update(Cart cartitem) {

    }

    @Override
    public void delete(int id) {
        this.execute(
            "DELETE FROM Cart WHERE Id = ?",
            id
        );
    }

    @Override
    public List<Cart> getByIds(Collection<? extends Number> ids) {
        if (CollectionUtils.isEmpty(ids)) {
            return new ArrayList<>();
        }

        final String condition = ids.stream().map(x -> "?").collect(Collectors.joining(", "));

        return this.query(
            String.format(
                "SELECT * FROM Cart WHERE Id IN (%s)",
                condition
            ),
            Cart::mappingDb,
            ids.toArray()
        );

    }

    public List<Cart> findByUserId(Integer userId) {
        return this.query(
            FIND_BY_USER_ID,
            Cart::mappingDb,
            userId
        );
    }

    public void deleteByIdAndUserId(Integer id, Integer userId) {
        this.execute(
            "DELETE FROM Cart WHERE Id = ? AND UserId = ?",
            id,
            userId
        );
    }

    public void updateQuantity(
        int quantity,
        String action,
        Integer userId,
        Integer id
    ) {
        final StringBuilder sqlBuilder = new StringBuilder("UPDATE Cart SET Quantity =");
        if (StringUtils.isNotBlank(action)) {
            sqlBuilder.append(" Quantity ")
                .append(action)
                .append(StringUtils.SPACE);
        }
        sqlBuilder.append(quantity).append(" WHERE Id = ? AND UserId = ?");
        this.execute(
            sqlBuilder.toString(),
            id,
            userId
        );
    }
}
