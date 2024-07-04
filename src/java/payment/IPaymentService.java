package payment;

import dto.GetPaymentResponse;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public interface IPaymentService {
    PaymentResponse payment(
        HttpServletRequest req,
        HttpServletResponse resp
    ) throws IOException;

    GetPaymentResponse query(Map<String, Object> header);
}
