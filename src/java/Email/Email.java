package Email;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class Email {
    // Email: minhhlnde170009@fpt.edu.vn
    // Password: qcfy lwjr qegx tehj
    static final String from = "minhhlnde170009@fpt.edu.vn";
    static final String password = "qcfy lwjr qegx tehj";

    public static boolean sendEmail(
        String to,
        String tieuDe,
        String noiDung
    ) {
        // Properties : khai báo các thuộc tính
        Properties props = new Properties();
        props.put(
            "mail.smtp.host",
            "smtp.gmail.com"
        ); // SMTP HOST
        props.put(
            "mail.smtp.port",
            "587"
        ); // TLS 587 SSL 465
        props.put(
            "mail.smtp.auth",
            "true"
        );
        props.put(
            "mail.smtp.starttls.enable",
            "true"
        );

        // create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(
                    from,
                    password
                );
            }
        };

        // Phiên làm việc
        Session session = Session.getInstance(
            props,
            auth
        );

        try {
            // Validate email address
            InternetAddress emailAddr = new InternetAddress(to);
            emailAddr.validate();

            // Tạo một tin nhắn
            MimeMessage msg = new MimeMessage(session);

            // Kiểu nội dung
            msg.addHeader(
                "Content-type",
                "text/HTML; charset=UTF-8"
            );

            // Người gửi
            msg.setFrom(new InternetAddress(from));

            // Người nhận
            msg.setRecipients(
                Message.RecipientType.TO,
                InternetAddress.parse(
                    to,
                    false
                )
            );

            // Tiêu đề email
            msg.setSubject(tieuDe);

            // Quy đinh ngày gửi
            msg.setSentDate(new Date());

            // Nội dung
            msg.setContent(
                noiDung,
                "text/HTML; charset=UTF-8"
            );

            // Gửi email
            Transport.send(msg);
            System.out.println("Gửi email thành công");
            return true;
        } catch (AddressException ae) {
            System.out.println("Gặp lỗi trong quá trình gửi email: Địa chỉ email không hợp lệ");
            ae.printStackTrace();
            return false;
        } catch (SendFailedException sfe) {
            System.out.println("Gặp lỗi trong quá trình gửi email: Địa chỉ email không hợp lệ hoặc không tồn tại");
            sfe.printStackTrace();
            return false;
        } catch (MessagingException e) {
            System.out.println("Gặp lỗi trong quá trình gửi email");
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        for (int i = 0; i < 10; i++) {
            boolean success = Email.sendEmail(
                "invalid-email@example.com",
                System.currentTimeMillis() + "",
                "Đây là phần nội dung!"
            );
            if (!success) {
                System.out.println("Failed to send email to invalid-email@example.com");
            }
        }
    }

}
