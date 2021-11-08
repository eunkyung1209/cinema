package com.kh.project.common.vo;

import org.springframework.web.multipart.MultipartFile;

public class MailVo {
	    private String senderName;    //발신자 이름
	    private String senderMail;    //발신자 이메일 주소
	    private String receiveMail;    //수신자 이메일 주소
	    private String subject;            //제목
	    private String message;            //본문
	    private MultipartFile files;	//파일 첨부
	    
	    
	    private String fromMail;
	    private String toMail;
	    private String title;
	    private String content;
	    
	    
	    
	    
	    public String getFromMail() {
			return fromMail;
		}
		public void setFromMail(String fromMail) {
			this.fromMail = "OISONE_CINEMA@gmail.com";
		}
		public String getToMail() {
			return toMail;
		}
		public void setToMail(String toMail) {
			this.toMail = toMail;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		public MultipartFile getFiles() {
			return files;
		}
		public void setFiles(MultipartFile files) {
			this.files = files;
		}
		//getter,setter,toString
	    public String getSenderName() {
	        return senderName;
	    }
	    public void setSenderName(String senderName) {
	        this.senderName = senderName;
	    }
	    public String getSenderMail() {
	        return senderMail;
	    }
	    public void setSenderMail(String senderMail) {
	        this.senderMail = senderMail;
	    }
	    public String getReceiveMail() {
	        return receiveMail;
	    }
	    public void setReceiveMail(String receiveMail) {
	        this.receiveMail = receiveMail;
	    }
	    public String getSubject() {
	        return subject;
	    }
	    public void setSubject(String subject) {
	        this.subject = subject;
	    }
	    public String getMessage() {
	        return message;
	    }
	    public void setMessage() {
	        String imgCodee;
	        imgCodee = "<html><body>이미지 빼고 그냥 친 코드</body></html>";
	        this.message = imgCodee;
	        
	    }
	    @Override
	    public String toString() {
	        return "EmailDTO [senderName=" + senderName + ", senderMail=" + senderMail + ", receiveMail=" + receiveMail
	                + ", subject=" + subject + ", message=" + message + "]";
	    }
	    
}
	

