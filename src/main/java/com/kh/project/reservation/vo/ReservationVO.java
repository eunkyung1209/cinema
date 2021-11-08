package com.kh.project.reservation.vo;

public class ReservationVO {
	private String resCode;
	private String id;
	private String mvTimeCode;
	private String seatName;
	private int seatCnt;
	private String reDate;
	private int totalPrice;
	
//	private String isPay;
	
	private String[] seatNames;
//	private String seats;
	
	
	
	public String getResCode() {
		return resCode;
	}
	public String[] getSeatNames() {
		return seatNames;
	}
	public void setSeatNames(String[] seatNames) {
		this.seatNames = seatNames;
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
	
//	public String[] getSeatNames() {
//		return seatNames;
//	}
//	public void setSeatNames(String[] seatNames) {
//		//this.seatNames = seatNames;
//		String seats = "";
//		for (String seat : seatNames) {
//			seats += seat + " ";
//		}
//		setSeats(seats);
//	}
//	public String getSeats() {
//		return seats;
//	}
//	public void setSeats(String seats) {
//		this.seats = seats;
//	}
	
}
