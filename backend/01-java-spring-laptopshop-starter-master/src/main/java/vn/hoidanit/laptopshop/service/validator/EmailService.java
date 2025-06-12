package vn.hoidanit.laptopshop.service.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
    @Autowired
    private JavaMailSender mailSender;
     public void sendVerificationEmail(String to, String token) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject("Xác thực email");
        message.setText("Vui lòng click vào link sau để xác thực email: " +
                       "http://localhost:8080/verify-email?token=" + token);
        mailSender.send(message);
    }
}
