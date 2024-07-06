package Servlet;

import DAO.CartDAO;
import Model.Cart;
import Model.User;
import cartitem.CartItemFactory;
import cartitem.ICartItemService;
import constant.AppConstant;
import constant.CartType;
import dto.CartDTO;
import exception.DuplicateException;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import payment.IPaymentService;
import payment.PaymentFactory;
import utils.SessionUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

@WebServlet(name = "cart-servlet", urlPatterns = "/cart/*")
public class CartServlet extends HttpServlet {

    private CartDAO cartDAO = null;

    @Override
    public void init() throws ServletException {
        this.cartDAO = new CartDAO();
    }

    @Override
    protected void doGet(
        HttpServletRequest req,
        HttpServletResponse resp
    ) throws ServletException, IOException {
        final String pathInfo = req.getPathInfo();
        final User user = SessionUtils.getAttributeSession(
            req,
            AppConstant.SESSION_KEY,
            User.class
        );
        if (StringUtils.isBlank(pathInfo)) {
            this.getCart(
                user,
                req,
                resp
            );
            return;
        }
        final String id = req.getParameter("id");

        switch (pathInfo) {
            case "/delete":
                try {
                    this.cartDAO.deleteByIdAndUserId(
                        Integer.parseInt(id),
                        user.getUserId()
                    );
                    SessionUtils.redirectAttribute(
                        req,
                        "__success__",
                        "Xoa gio hang thanh cong"
                    );
                } catch (Exception ex) {
                    SessionUtils.redirectAttribute(
                        req,
                        "__error__",
                        "Xoa gio hang that bai"
                    );
                }
                resp.sendRedirect(req.getContextPath() + "/cart");
                return;

            case "/decrease":
            case "/increase":
                final String action = "/increase".equals(pathInfo)
                    ? "+"
                    : "-";
                final Integer amt = Optional.ofNullable(req.getParameter("amt"))
                    .filter(StringUtils::isNotBlank)
                    .filter(NumberUtils::isCreatable)
                    .map(NumberUtils::toInt)
                    .orElse(1);
                this.cartDAO.updateQuantity(
                    amt,
                    action,
                    user.getUserId(),
                    Integer.parseInt(id)
                );
                SessionUtils.redirectAttribute(
                    req,
                    "__success__",
                    "Cap nhat gio hang thanh cong"
                );
                resp.sendRedirect(req.getContextPath() + "/cart");
                return;
            default:
                resp.sendError(404);
        }

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
        final String pathInfo = req.getPathInfo();
        if (StringUtils.isBlank(pathInfo)) {
            this.addToCart(
                user,
                req,
                resp
            );
            return;
        }

        switch (pathInfo) {
            case "/paid" -> {
                final String id = req.getParameter("id");
                final int anInt = NumberUtils.toInt(id);
                final Cart cart = this.cartDAO.get(anInt).orElseThrow();
                if (user.getUserId() != cart.getUserId()) {
                    throw new ServletException("Permission denied");
                }
                req.setAttribute("itemId", cart.getItemId());
                final ICartItemService cartItemHandler = CartItemFactory.getCartItemHandler(cart.getType());
                cartItemHandler.purchase(req, resp);
            }
        }
    }

    private void addToCart(
        User user,
        HttpServletRequest req,
        HttpServletResponse resp
    ) throws IOException {
        final String type = req.getParameter("type");
        final String itemId = req.getParameter("itemId");
        Cart cart = new Cart();
        cart.setUserId(user.getUserId());
        cart.setType(CartType.valueOf(type));
        cart.setItemId(Integer.valueOf(itemId));
        this.cartDAO.save(cart);
        SessionUtils.redirectAttribute(
            req,
            "__success__",
            "Them gio hang thanh cong"
        );
        resp.sendRedirect(req.getParameter("returnUrl"));
    }

    private void getCart(
        User user,
        HttpServletRequest req,
        HttpServletResponse resp
    ) throws ServletException, IOException {
        final List<CartDTO> carts = this.cartDAO.findByUserId(user.getUserId()).stream().map(x -> {
            CartDTO cartDTO = new CartDTO();
            cartDTO.setId(x.getId());
            cartDTO.setType(x.getType());
            cartDTO.setQuantity(x.getQuantity());
            cartDTO.setItemId(x.getItemId());
            cartDTO.setUserId(x.getUserId());
            return cartDTO;
        }).collect(Collectors.toList());
        final Map<CartType, List<CartDTO>> cartMap = carts.stream().collect(Collectors.groupingBy(Cart::getType));
        cartMap.keySet().forEach(type -> {
            final Map<Integer, CartDTO> collect = cartMap.get(type).stream().collect(Collectors.toMap(
                CartDTO::getItemId,
                Function.identity()
            ));
            final ICartItemService cartItemHandler = CartItemFactory.getCartItemHandler(type);
            cartItemHandler.get(collect.keySet()).forEach(item -> {
                final CartDTO cartDTO = collect.get(item.getKey());
                cartDTO.setItem(item);
            });
        });

        req.setAttribute(
            "carts",
            carts
        );
        req.getRequestDispatcher("HOME/cart.jsp").forward(
            req,
            resp
        );
    }
}
