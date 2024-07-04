package dto;

import com.google.gson.annotations.SerializedName;

import java.math.BigDecimal;

public class VnPayPaymentResponse extends GetPaymentResponse {

    @SerializedName("vnp_ResponseId")
    private String responseId;

    @SerializedName("vnp_Command")
    private String command;

    @SerializedName("vnp_TmnCode")
    private String tmnCode;

    @SerializedName("vnp_TxnRef")
    private String txnRef;

    @SerializedName("vnp_Amount")
    private BigDecimal amount;

    @SerializedName("vnp_OrderInfo")
    private String orderInfo;

    @SerializedName("vnp_ResponseCode")
    private String responseCode;

    @SerializedName("vnp_Message")
    private String message;

    @SerializedName("vnp_BankCode")
    private String bankCode;

    @SerializedName("vnp_PayDate")
    private String payDate;

    @SerializedName("vnp_TransactionNo")
    private BigDecimal transactionNo;

    @SerializedName("vnp_TransactionType")
    private Integer transactionType;

    @SerializedName("vnp_TransactionStatus")
    private String transactionStatus;

    @SerializedName("vnp_PromotionCode")
    private Integer promotionCode;

    @SerializedName("vnp_PromotionAmount")
    private Integer promotionAmount;

    @SerializedName("vnp_SecureHash")
    private String secureHash;

    @Override
    public boolean isSuccess() {
        return "00".equals(this.responseCode) && "00".equals(this.transactionStatus);
    }

    public String getResponseId() {
        return responseId;
    }

    public void setResponseId(String responseId) {
        this.responseId = responseId;
    }

    public String getCommand() {
        return command;
    }

    public void setCommand(String command) {
        this.command = command;
    }

    public String getTmnCode() {
        return tmnCode;
    }

    public void setTmnCode(String tmnCode) {
        this.tmnCode = tmnCode;
    }

    public String getTxnRef() {
        return txnRef;
    }

    public void setTxnRef(String txnRef) {
        this.txnRef = txnRef;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getOrderInfo() {
        return orderInfo;
    }

    public void setOrderInfo(String orderInfo) {
        this.orderInfo = orderInfo;
    }

    public String getResponseCode() {
        return responseCode;
    }

    public void setResponseCode(String responseCode) {
        this.responseCode = responseCode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getBankCode() {
        return bankCode;
    }

    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }

    public String getPayDate() {
        return payDate;
    }

    public void setPayDate(String payDate) {
        this.payDate = payDate;
    }

    public BigDecimal getTransactionNo() {
        return transactionNo;
    }

    public void setTransactionNo(BigDecimal transactionNo) {
        this.transactionNo = transactionNo;
    }

    public Integer getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(Integer transactionType) {
        this.transactionType = transactionType;
    }

    public String getTransactionStatus() {
        return transactionStatus;
    }

    public void setTransactionStatus(String transactionStatus) {
        this.transactionStatus = transactionStatus;
    }

    public Integer getPromotionCode() {
        return promotionCode;
    }

    public void setPromotionCode(Integer promotionCode) {
        this.promotionCode = promotionCode;
    }

    public Integer getPromotionAmount() {
        return promotionAmount;
    }

    public void setPromotionAmount(Integer promotionAmount) {
        this.promotionAmount = promotionAmount;
    }

    public String getSecureHash() {
        return secureHash;
    }

    public void setSecureHash(String secureHash) {
        this.secureHash = secureHash;
    }


}
