package dto;

import java.math.BigDecimal;

public class CartItem {

    private Integer key;
    private Object data;
    private BigDecimal price;

    public CartItem(
        Integer key,
        Object data,
        BigDecimal price
    ) {
        this.key = key;
        this.data = data;
        this.price = price;
    }

    public Integer getKey() {
        return key;
    }

    public void setKey(Integer key) {
        this.key = key;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}
