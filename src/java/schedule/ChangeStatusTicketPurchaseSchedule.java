package schedule;

import DAO.TicketPurchaseDAO;
import Model.TicketPurchase;
import dto.GetPaymentResponse;
import exception.NotFoundTransactionException;
import payment.IPaymentService;
import payment.PaymentFactory;

import java.util.*;
import java.util.logging.Logger;

public class ChangeStatusTicketPurchaseSchedule implements Runnable {

    private static final Logger logger = Logger.getLogger(ChangeStatusTicketPurchaseSchedule.class.getName());

    private final Properties properties;

    private final TicketPurchaseDAO ticketPurchaseDAO = new TicketPurchaseDAO();

    public ChangeStatusTicketPurchaseSchedule(Properties properties) {
        this.properties = properties;
    }

    @Override
    public void run() {
        logger.info("start job change status ticket purchase");
        final List<TicketPurchase> processingPurchase = this.ticketPurchaseDAO.getProcessingPurchase();
        List<Integer> deleteId = new ArrayList<>();
        for (TicketPurchase ticketPurchase : processingPurchase) {
            try {
                final String paymentMethod = ticketPurchase.getPaymentMethod();
                final IPaymentService paymentService = PaymentFactory.getPaymentService(paymentMethod);
                Map<String, Object> map = new HashMap<>();
                map.put(
                    TicketPurchase.class.getName(),
                    ticketPurchase
                );
                map.put(
                    Properties.class.getName(),
                    this.properties
                );
                final GetPaymentResponse response = paymentService.query(map);
                if (response.isSuccess()) {
                    ticketPurchase.setStatus(1);
                }
            } catch (NotFoundTransactionException ex) {
                deleteId.add(ticketPurchase.getPurchaseID());
            }
        }
        if (!deleteId.isEmpty()) {
            this.ticketPurchaseDAO.deleteBatch(deleteId);
        }
        this.ticketPurchaseDAO.updateBatch(processingPurchase);
        logger.info("end job change status ticket purchase");
    }
}
