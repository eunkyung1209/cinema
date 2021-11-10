package com.kh.project.reservation.vo;

public class ReservationVO {
	//DB에 컬럼들
	private String resCode;
	private String id;
	private String mvTimeCode;
	private String seatName;
	private int seatCnt;
	private String reDate;
	private int totalPrice;
	
	//추가로 가져올 데이터
	private String attachedImgName;
	private int age;
	private String title;
	private String loc;
	private String areaName;
	private String theaterName;
	private String screenDay;
    private String screenTime;
    private String screenEndTime;
	
    //선택한 좌석 리스트
	private String[] seatNames;
	
	
	
	public String getResCode() {
		return resCode;
	}
	public void setResCode(String resCode) {
		this.resCode = resCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMvTimeCode() {
		return mvTimeCode;
	}
	public void setMvTimeCode(String mvTimeCode) {
		this.mvTimeCode = mvTimeCode;
	}
	public String getSeatName() {
		return seatName;
	}
	public void setSeatName(String seatName) {
		this.seatName = seatName;
	}
	public int getSeatCnt() {
		return seatCnt;
	}
	public void setSeatCnt(int seatCnt) {
		this.seatCnt = seatCnt;
	}
	public String getReDate() {
		return reDate;
	}
	public void setReDate(String reDate) {
		this.reDate = reDate;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
//	public String getIsPay() {
//		return isPay;
//	}
//	public void setIsPay(String isPay) {
//		this.isPay = isPay;
//	}
	
	//선택한 좌석 리스트
	public String[] getSeatNames() {
		return seatNames;
	}
	public void setSeatNames(String[] seatNames) {
		this.seatNames = seatNames;
		
		String seatName = "";
		for (int i = 0; i < seatNames.length; i++) {
			seatName += seatNames[i];
			if(i != seatNames.length - 1) {
				seatName += ", ";
			}
		}
		setSeatName(seatName);
	}
	
	//추가로 가져올 데이터
	public String getAttachedImgName() {
		return attachedImgName;
	}
	public void setAttachedImgName(String attachedImgName) {
		this.attachedImgName = attachedImgName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public String getTheaterName() {
		return theaterName;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public String getScreenDay() {
		return screenDay;
	}
	public void setScreenDay(String screenDay) {
		this.screenDay = screenDay;
	}
	public String getScreenTime() {
		return screenTime;
	}
	public void setScreenTime(String screenTime) {
		this.screenTime = screenTime;
	}
	public String getScreenEndTime() {
		return screenEndTime;
	}
	public void setScreenEndTime(String screenEndTime) {
		this.screenEndTime = screenEndTime;
	}
	
}
