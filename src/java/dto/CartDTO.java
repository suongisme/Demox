package dto;

import Model.Cart;

public class CartDTO extends Cart {

    private CartItem item;

    public CartItem getItem() {
        return item;
    }

    public void setItem(CartItem item) {
        this.item = item;
    }

}
