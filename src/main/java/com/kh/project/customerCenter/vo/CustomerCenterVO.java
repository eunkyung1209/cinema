package com.kh.project.customerCenter.vo;

//고객센터 게시판
public class CustomerCenterVO {
	
	private String customerCode; 
    private String createDate;
    private String writer;
    private String title;
    private String content;
    private String isRead;
    private String secretNumber;
    
    
    
	public String getCustomerCode() {
		return customerCode;
	}
	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public String getIsRead() {
		return isRead;
	}
	public void setIsRead(String isRead) {
		this.isRead = isRead;
	}
	public String getSecretNumber() {
		return secretNumber;
	}
	public void setSecretNumber(String secretNumber) {
		this.secretNumber = secretNumber;
	}
    
	
	
}
