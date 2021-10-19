package com.kh.project.customerCenter.vo;

//고객센터 게시판 댓글
public class CustomerCenterReplyVO {
	
	 	private String customerReplyCode; 
	    private String createDate; 
	    private String writer;
	    private String content;
	    private String customerCode;
	    
	    
		public String getCustomerReplyCode() {
			return customerReplyCode;
		}
		public void setCustomerReplyCode(String customerReplyCode) {
			this.customerReplyCode = customerReplyCode;
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
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getCustomerCode() {
			return customerCode;
		}
		public void setCustomerCode(String customerCode) {
			this.customerCode = customerCode;
		}
	    
	    
	    
	    
}
