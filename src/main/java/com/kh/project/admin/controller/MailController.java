package com.kh.project.admin.controller;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.project.common.vo.MailVo;
import com.kh.project.member.vo.MemberVO;
 
 
@Controller // 컨트롤러 어노테이션 선언
@RequestMapping("/mail") // 공통적인 매핑 주소
public class MailController {
	String msgFlag = "";
	
	@Autowired
	JavaMailSender mailSender;
	
	@GetMapping("/mailForm")
	public String mailFormGet() {
		return "reservation/write";
	}

	@PostMapping("/mailForm")
	public String mailFormPost(MailVo vo, HttpSession session){
		System.out.println("메소드!!");
		
		String id = ((MemberVO)(session.getAttribute("loginInfo"))).getId();
		
		String fromMail = "abcd@gmail.com";
		String toMail = vo.getToMail();
		String title = vo.getTitle();
		String content = vo.getContent();
		
		
		
		try {
			System.out.println("트라이문@@!!");
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");

			//메일 보관함에 저장
			messageHelper.setFrom(fromMail);
			messageHelper.setTo(toMail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			
			//메세지 내용과 함께 사진을 전송한다
			content = content.replace("\n", "<br/>");
			content += "<br><hr><h3>OISONE CINEMA입니다.<h3><hr><br>";
			content += "<a href=\"http://localhost:8081//reservation/goMyReservation?id="+ id + "\"><img src=\"cid:이메일.png\" width='500px'></a>";
			messageHelper.setText(content, true);
//			FileSystemResource file = new FileSystemResource(new File("C:\\Users\\YJH\\git\\cinema\\src\\main\\webapp\\resources\\images\\reservation\\이메일.png"));	//정훈
			FileSystemResource file = new FileSystemResource(new File("D:\\workspaceSTS\\Cinema\\src\\main\\webapp\\resources\\images\\reservation\\이메일.png"));		
			messageHelper.addInline("이메일.png", file);
			
//			//메일과 함께 첨부파일 전송하기
//			FileSystemResource mfile = new FileSystemResource(new File("C:\\Users\\YJH\\git\\cinema\\src\\main\\webapp\\resources\\images\\reservation\\이메일.png"));
//			messageHelper.addAttachment("이메일.png", mfile);
			
			//메세지 내용과 함께 사진을 전송한다
			mailSender.send(message); //실제 메일 전송
			
			
		} catch (MessagingException e) {
			System.out.println("실패문!!!");
			e.printStackTrace();
		}
		
		return "redirect:/movie/mainPage";
		
	}
	
}