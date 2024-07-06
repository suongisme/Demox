package payment.impl;

import Model.Ticket;
import Model.TicketPurchase;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import constant.AppConstant;
import dto.GetPaymentResponse;
import dto.VnPayPaymentResponse;
import exception.NotFoundTransactionException;
import payment.PaymentResponse;
import utils.VnpayUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.Logger;

public class VnPayPaymentService extends AbstractTicketPurchasePaymentService {
    private final Logger logger = Logger.getLogger(this.getClass().getName());

    private final Gson gson = new Gson();

    @Override
    public PaymentResponse payment(
        HttpServletRequest req,
        HttpServletResponse reps,
        Map<String, Object> header
    ) throws IOException {
        final TicketPurchase ticketPurchase = (TicketPurchase) header.get(TicketPurchase.class.getName());
        final Ticket ticket = (Ticket) header.get(Ticket.class.getName());
        final Properties properties = (Properties) req.getServletContext()
            .getAttribute(AppConstant.APPLICATION_CONFIG_KEY);
        BigDecimal amount = ticket.getPrice().multiply(new BigDecimal("100")).setScale(0);
        final String orderInfoTemplate = properties.getProperty("vnpay.order-info-template");
        final String secretKey = properties.getProperty("vnpay.secret-key");
        final String payUrl = properties.getProperty("vnpay.pay-url");

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put(
            "vnp_Version",
            properties.getProperty("vnpay.version")
        );
        vnp_Params.put(
            "vnp_Command",
            "pay"
        );
        vnp_Params.put(
            "vnp_TmnCode",
            properties.getProperty("vnpay.tmn-code")
        );
        vnp_Params.put(
            "vnp_Amount",
            String.valueOf(amount)
        );
        vnp_Params.put(
            "vnp_CurrCode",
            "VND"
        );
        vnp_Params.put(
            "vnp_TxnRef",
            ticketPurchase.getPurchaseID().toString()
        );
        vnp_Params.put(
            "vnp_OrderInfo",
            String.format(
                orderInfoTemplate,
                ticketPurchase.getPurchaseID()
            )
        );
        vnp_Params.put(
            "vnp_OrderType",
            "other"
        );

        vnp_Params.put(
            "vnp_Locale",
            "vn"
        );
        String returnUrl = properties.getProperty("vnpay.return-url");
        if (!returnUrl.startsWith("http")) {
            returnUrl = String.format(
                "%s://%s:%s%s/%s",
                req.getScheme(),
                req.getServerName(),
                req.getServerPort(),
                req.getContextPath(),
                returnUrl
            );
        }
        vnp_Params.put(
            "vnp_ReturnUrl",
            returnUrl
        );
        vnp_Params.put(
            "vnp_IpAddr",
            VnpayUtils.getIpAddress(req)
        );

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put(
            "vnp_CreateDate",
            vnp_CreateDate
        );

        cld.add(
            Calendar.MINUTE,
            3
        );
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put(
            "vnp_ExpireDate",
            vnp_ExpireDate
        );

        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator<String> itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = itr.next();
            String fieldValue = vnp_Params.get(fieldName);
            if ((fieldValue != null) && (!fieldValue.isEmpty())) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(
                    fieldValue,
                    StandardCharsets.US_ASCII
                ));
                //Build query
                query.append(URLEncoder.encode(
                    fieldName,
                    StandardCharsets.US_ASCII
                ));
                query.append('=');
                query.append(URLEncoder.encode(
                    fieldValue,
                    StandardCharsets.US_ASCII
                ));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = VnpayUtils.hmacSHA512(
            secretKey,
            hashData.toString()
        );
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = payUrl + "?" + queryUrl;
        reps.sendRedirect(paymentUrl);
        return new PaymentResponse();
    }

    @Override
    public GetPaymentResponse query(
        TicketPurchase ticketPurchase,
        Properties properties
    ) {
        String vnp_RequestId = UUID.randomUUID().toString();
        String vnp_Version = "2.1.0";
        String vnp_Command = "querydr";
        String vnp_TmnCode = properties.getProperty("vnpay.tmn-code");
        String vnp_TxnRef = ticketPurchase.getPurchaseID().toString();
        String vnp_OrderInfo = String.format(
            properties.getProperty("vnpay.order-info-template"),
            ticketPurchase.getPurchaseID()
        );
        //String vnp_TransactionNo = req.getParameter("transactionNo");
        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_TransDate = formatter.format(ticketPurchase.getPurchaseDate());
        String vnp_CreateDate = formatter.format(cld.getTime());

        String vnp_IpAddr = "0.0.0.0";

        JsonObject vnp_Params = new JsonObject();

        vnp_Params.addProperty(
            "vnp_RequestId",
            vnp_RequestId
        );
        vnp_Params.addProperty(
            "vnp_Version",
            vnp_Version
        );
        vnp_Params.addProperty(
            "vnp_Command",
            vnp_Command
        );
        vnp_Params.addProperty(
            "vnp_TmnCode",
            vnp_TmnCode
        );
        vnp_Params.addProperty(
            "vnp_TxnRef",
            vnp_TxnRef
        );
        vnp_Params.addProperty(
            "vnp_OrderInfo",
            vnp_OrderInfo
        );
        //vnp_Params.put("vnp_TransactionNo", vnp_TransactionNo);
        vnp_Params.addProperty(
            "vnp_TransactionDate",
            vnp_TransDate
        );
        vnp_Params.addProperty(
            "vnp_CreateDate",
            vnp_CreateDate
        );
        vnp_Params.addProperty(
            "vnp_IpAddr",
            vnp_IpAddr
        );

        String hash_Data = String.join(
            "|",
            vnp_RequestId,
            vnp_Version,
            vnp_Command,
            vnp_TmnCode,
            vnp_TxnRef,
            vnp_TransDate,
            vnp_CreateDate,
            vnp_IpAddr,
            vnp_OrderInfo
        );
        String vnp_SecureHash = VnpayUtils.hmacSHA512(
            properties.getProperty("vnpay.secret-key"),
            hash_Data
        );

        vnp_Params.addProperty(
            "vnp_SecureHash",
            vnp_SecureHash
        );

        try {
            URL url = new URL(properties.getProperty("vnpay.api-url"));
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty(
                "Content-Type",
                "application/json"
            );
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(vnp_Params.toString());
            wr.flush();
            wr.close();
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String output;
            StringBuffer response = new StringBuffer();
            while ((output = in.readLine()) != null) {
                response.append(output);
            }
            in.close();
            final VnPayPaymentResponse vnPayPaymentResponse = gson.fromJson(
                response.toString(),
                VnPayPaymentResponse.class
            );
            logger.info("response " + response);
            if (Objects.nonNull(vnPayPaymentResponse) && "91".equals(vnPayPaymentResponse.getResponseCode())) {
                throw new NotFoundTransactionException();
            }
            return vnPayPaymentResponse;
        } catch (IOException e) {
            return new VnPayPaymentResponse();
        }
    }
}
