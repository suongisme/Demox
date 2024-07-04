package Servlet;

import DAO.CartDAO;
import Model.Cart;
import Model.User;
import constant.AppConstant;
import constant.CartType;
import utils.SessionUtils;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "cart-servlet", urlPatterns = "/cart/*")
public class CartServlet extends HttpServlet {

    private CartDAO cartDAO = null;

    @Override
    public void init() throws ServletException {
        this.cartDAO = new CartDAO();
    }

    @Override
    protected void doPost(
        HttpServletRequest req,
        HttpServletResponse resp
    ) throws ServletException, IOException {
        final User user = SessionUtils.getAttributeSession(
            req,
            AppConstant.SESSION_KEY,
            User.class
        );
        final String type = req.getParameter("type");
        final String itemId = req.getParameter("itemId");
        Cart cart = new Cart();
        cart.setUserId(user.getUserId());
        cart.setType(CartType.valueOf(type));
        cart.setItemId(Integer.valueOf(itemId));
        this.cartDAO.save(cart);
        SessionUtils.redirectAttribute(req, "__success__", "Them gio hang thanh cong");
        resp.sendRedirect(req.getParameter("returnUrl"));
    }
}
