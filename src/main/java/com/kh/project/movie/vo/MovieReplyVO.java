package com.kh.project.movie.vo;

//영화정보에 달린 댓글
public class MovieReplyVO {
	private String mvReplyCode;
	private String createDate;
	private int grade;
	private String writer;
	private String mvReplyContent;
	private String mvCode;
	
	public String getMvReplyCode() {
		return mvReplyCode;
	}
	public void setMvReplyCode(String mvReplyCode) {
		this.mvReplyCode = mvReplyCode;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getMvReplyContent() {
		return mvReplyContent;
	}
	public void setMvReplyContent(String mvReplyContent) {
		this.mvReplyContent = mvReplyContent;
	}
	public String getMvCode() {
		return mvCode;
	}
	public void setMvCode(String mvCode) {
		this.mvCode = mvCode;
	}
}
