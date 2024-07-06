package cartitem;

import dto.CartItem;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;
import java.util.List;

public interface ICartItemService {
    List<CartItem> get(Collection<? extends Number> ids);
    void purchase(HttpServletRequest req, HttpServletResponse resp) throws IOException;
}
