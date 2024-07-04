package Model;

import constant.CartType;
import org.apache.commons.lang3.StringUtils;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Cart {
    private Integer id;
    private Integer userId;
    private CartType type;
    private Integer itemId;
    private Integer quantity;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public CartType getType() {
        return type;
    }

    public void setType(CartType type) {
        this.type = type;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public static Cart mappingDb(ResultSet resultSet) throws SQLException {
        Cart cart = new Cart();
        cart.setId(resultSet.getInt("Id"));
        cart.setUserId(resultSet.getInt("UserId"));
        cart.setItemId(resultSet.getInt("ItemId"));
        cart.setQuantity(resultSet.getInt("Quantity"));
        final String cartType = resultSet.getString("type");
        if (StringUtils.isNotBlank(cartType)) {
            final CartType cartTypeEnum = CartType.valueOf(cartType);
            cart.setType(cartTypeEnum);
        }
        return cart;
    }
}
