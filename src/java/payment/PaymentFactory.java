package payment;

import payment.impl.VnPayPaymentService;

public class PaymentFactory {

    private static final VnPayPaymentService vnPayPaymentService = new VnPayPaymentService();

    public static IPaymentService getPaymentService(String methodPayment) {
        if ("vnpay".equalsIgnoreCase(methodPayment)) {
            return vnPayPaymentService;
        }
        throw new UnsupportedOperationException("");
    }
}
