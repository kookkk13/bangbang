package com.kh.bangbang.member.model.service;

import java.util.Date;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	private String email;
	
	public SendMail() {}

	public SendMail(String email) {
		this.email = email;
	}
	
	//이메일 전송
	public String sendEmail() {
		int result = 0;
		
		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true"); // gmail은 무조건 true 고정
		p.put("mail.smtp.host", "smtp.gmail.com");  // smtp 서버 주소
		p.put("mail.smtp.auth", "true"); 			// gmail은 무조건 true 고정
		p.put("mail.smtp.port", "587"); 			// gmail 포트
		Authenticator auth = new MyAuthentication();

		// session 생성 및 MimeMessage생성
		Session session = Session.getDefaultInstance(p, auth);
		MimeMessage msg = new MimeMessage(session);
		
		String uuid = UUIDPwd();

		try {
			// 편지보낸시간
			msg.setSentDate(new Date());
			InternetAddress from = new InternetAddress();
			
			// 이메일 발신자
			from = new InternetAddress("BangBang");
			msg.setFrom(from);
			
			// 이메일 수신자
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);

			// 이메일 제목
			msg.setSubject("BangBang 비밀번호 재설정 안내 메일");
			// 이메일 내용
			msg.setText("<p>변경된 비밀번호입니다.</p><p>아래의 비밀번호로 다시 로그인 해주세요.</p><p><b>임시 비밀번호 : " + uuid +
					    "</b></p><p>로그인 후 새로운 비밀번호로 변경하시길 바랍니다.</p>", "UTF-8");
			// 이메일 헤더
			msg.setHeader("content-Type", "text/html");

			System.out.println("Sending...");
			// 메일보내기
			javax.mail.Transport.send(msg);
			
		} catch (AddressException addr_e) {
			addr_e.printStackTrace();
			System.out.println("Addr Error");
			result = -1;
		} catch (MessagingException msg_e) {
			msg_e.printStackTrace();
			System.out.println("Msg Error");
			result = -1;
		}
		System.out.println("Success");
		
		if(result == 0)
			return uuid;
		else
			return "";
	}
	
	//임시 비밀번호 생성
	public String UUIDPwd() {
        String uuid = "";
        
		uuid = UUID.randomUUID().toString().replaceAll("-", "");	// -를 제거
		uuid = uuid.substring(0, 10); 							// 10자리로 자름
        return uuid;
    }

}

class MyAuthentication extends Authenticator {
	PasswordAuthentication pa;

	public MyAuthentication() {
		String id = "betatest1313@gmail.com"; // 구글 ID
		String pw = "test1111."; // 구글 비밀번호

		// ID와 비밀번호를 입력
		pa = new PasswordAuthentication(id, pw);
	}

	// 시스템에서 사용하는 인증정보
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}

}
