package swp.service;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import swp.DAO.impl.MyUserDAOImpl;

@Service
public class MailService {
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private MyUserDAOImpl myUserDAOImpl;

	public void sendText(String email) throws AddressException, MessagingException {
		Properties mailServerProperties;
		Session getMailSession;
		MimeMessage mailMessage;

		// Step1: setup Mail Server
		mailServerProperties = System.getProperties();
		mailServerProperties.put("mail.smtp.port", "587");
		mailServerProperties.put("mail.smtp.auth", "true");
		mailServerProperties.put("mail.smtp.starttls.enable", "true");

		// Step2: get Mail Session
		getMailSession = Session.getDefaultInstance(mailServerProperties, null);
		mailMessage = new MimeMessage(getMailSession);

		// Dia chi nguoi nhan
		mailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
		
		// Tao password ngau nhien va ma hoa
		String pass = RandomStringUtils.randomAlphanumeric(8);
		String passEncode = passwordEncoder.encode(pass);
		
		//Luu password moi vao CSDL
		myUserDAOImpl.resetPasswordUser(email, passEncode);
		
		mailMessage.setSubject("Xổ số Việt");
		mailMessage.setText("Mật khẩu mới của bạn dùng để đăng nhập hệ thống là: " + pass);

		// Step3: Send mail
		Transport transport = getMailSession.getTransport("smtp");
		// Nhap email 
		transport.connect("smtp.gmail.com", "ninh2407@gmail.com", "cp1dkttcn1ytrb");
		transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
		transport.close();
	}

}
