package cartitem;

import DAO.DAO;
import DAO.TicketDAO;
import DAO.MatchScheduleDAO;
import DAO.TeamDAO;
import cartitem.impl.TicketCartItemService;
import constant.CartType;

public class CartItemFactory {

    private static TicketCartItemService ticketCartItemService;

    static {
        ticketCartItemService = new TicketCartItemService(
            new TicketDAO(),
            new MatchScheduleDAO(),
            new TeamDAO()
        );
    }

    public static ICartItemService getCartItemHandler(CartType type) {
        return switch (type) {
            case TICKET -> ticketCartItemService;
            default -> {
                throw new UnsupportedOperationException("");
            }
        };
    }
}
