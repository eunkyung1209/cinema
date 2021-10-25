package com.kh.project.community.vo;

//커뮤니티 게시판
public class CommunityVO {
	private String commuCode;
	private String writer;
	private String createDate;
	private int readCnt;
	private String title;
	private String content;
	private String secret;
	private String is_secret;
	
	
	public String getCommuCode() {
		return commuCode;
	}
	public void setCommuCode(String commuCode) {
		this.commuCode = commuCode;
	}
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
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
	
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	
	public String getIs_secret() {
		return is_secret;
	}
	public void setIs_secret(String is_secret) {
		this.is_secret = is_secret;
	}
	
}
