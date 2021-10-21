package com.kh.project.member.vo;

public class MemberVO {
	private String id;
	private String pw;
	private String name;
	private String nickName;
	private String birthday;
	private String gender;
	private String tell;
	private String email;
	private int point;
	private int savedMoney;
	private String marketingAgree;
	private String isAdmin;
	private String joinDate;
	private String nonpeopleTicket;
	private String myCinema;
	
	private String[] tells;		//전화번호 010, 1111, 2222
	private String[] addr;
	/*
	 * private String[] emails; //이메일 qwer, naver.com
	 */	
	
	
	
	public String[] getAddr() {
		return addr;
	}
	public void setAddr(String[] addr) {
		
		String myCinema = addr[0] + addr[1]  + addr[2];
		setMyCinema(myCinema);
	}
	
	
	public String[] getTells() {
		return tells;
	}
	public void setTells(String[] tells) {
		String tell = tells[0] + "-" + tells[1] + "-" + tells[2];
		setTell(tell);
	}
	/*
	 * public String[] getEmails() { return emails; } public void setEmails(String[]
	 * emails) { String email = emails[0] + "@" + emails[1]; setEmail(email); }
	 */
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	//전화번호
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	
	//이메일
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getSavedMoney() {
		return savedMoney;
	}
	public void setSavedMoney(int savedMoney) {
		this.savedMoney = savedMoney;
	}
	public String getMarketingAgree() {
		return marketingAgree;
	}
	public void setMarketingAgree(String marketingAgree) {
		this.marketingAgree = marketingAgree;
	}
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String getNonpeopleTicket() {
		return nonpeopleTicket;
	}
	public void setNonpeopleTicket(String nonpeopleTicket) {
		this.nonpeopleTicket = nonpeopleTicket;
	}
	public String getMyCinema() {
		return myCinema;
	}
	public void setMyCinema(String myCinema) {
		this.myCinema = myCinema;
	}
	
}
