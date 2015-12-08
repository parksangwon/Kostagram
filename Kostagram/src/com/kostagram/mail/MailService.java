package com.kostagram.mail;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

public class MailService{

    @Autowired
    protected JavaMailSender mailSender;

    public boolean SendEmail(Mail mail) throws Exception {
	boolean result = false;
	MimeMessage msg = mailSender.createMimeMessage();
	try {
	    msg.setSubject(mail.getSubject());
	    msg.setText(mail.getContent());
	    msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(mail.getReceiver()));

	} catch (MessagingException e) {
	    System.out.println("MessagingException");
	    e.printStackTrace();
	    return false;
	}
	try {
	    mailSender.send(msg);
	} catch (MailException e) {
	    System.out.println("MailException¹ß»ý");
	    e.printStackTrace();
	    return false;
	}
	return true;
    }
}
