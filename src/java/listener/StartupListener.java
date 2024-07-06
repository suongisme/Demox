package listener;


import constant.AppConstant;
import schedule.ChangeStatusTicketPurchaseSchedule;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.time.Duration;
import java.util.Properties;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;

public class StartupListener implements ServletContextListener {
    private final ScheduledExecutorService scheduledExecutorService = Executors.newScheduledThreadPool(100);
    private final Logger logger = Logger.getLogger(this.getClass().getName());
    private final Properties properties = new Properties();

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        logger.info("start up");
        this.loadConfig(servletContextEvent);
        this.registerSchedule();
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        this.scheduledExecutorService.shutdown();
    }

    private void loadConfig(ServletContextEvent servletContextEvent) {
        this.properties.put(
            "job.change-status-ticket-purchase.delay",
            "2M"
        ); // 5 phut chayj 1 lan
        this.properties.put(
            "vnpay.pay-url",
            "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html"
        );
        this.properties.put(
            "vnpay.return-url",
            "ticket/paid"
        );
        this.properties.put(
            "vnpay.tmn-code",
            "771K20FE"
        );
        this.properties.put(
            "vnpay.secret-key",
            "M62N9IZ05PMLD4Z4HXCVRUE6NUK0Y8EI"
        );
        this.properties.put(
            "vnpay.api-url",
            "https://sandbox.vnpayment.vn/merchant_webapi/api/transaction"
        );
        this.properties.put(
            "vnpay.version",
            "2.1.0"
        );
        this.properties.put(
            "vnpay.order-info-template",
            "THANH TOAN %s"
        );

        servletContextEvent.getServletContext().setAttribute(
            AppConstant.APPLICATION_CONFIG_KEY,
            properties
        );
        logger.info("load application.properties successfully");
    }

    private void registerSchedule() {
        final String delayTime = this.properties.getProperty("job.change-status-ticket-purchase.delay");
        final Duration duration = Duration.parse("PT" + delayTime);
        final long millis = duration.toMillis();
        scheduledExecutorService.scheduleAtFixedRate(
            new ChangeStatusTicketPurchaseSchedule(this.properties),
            millis,
            millis,
            TimeUnit.MILLISECONDS
        );
        logger.info("register ChangeStatusBillSchedule successfully");
    }
}
