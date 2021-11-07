package com.kh.project.reservation.vo;

public class ReservationVO {
	private int reNum;
	private String id;
	private String mvTimeCode;
	private int seatCnt;
	private String[] seatNames;
	private String seats;
	private String reDate;
	private int totalPrice;
	
	public int getReNum() {
		return reNum;
	}
	public void setReNum(int reNum) {
		this.reNum = reNum;
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
	public int getSeatCnt() {
		return seatCnt;
	}
	public void setSeatCnt(int seatCnt) {
		this.seatCnt = seatCnt;
	}
	
	public String[] getSeatNames() {
		return seatNames;
	}
	public void setSeatNames(String[] seatNames) {
		//this.seatNames = seatNames;
		String seats = "";
		for (String seat : seatNames) {
			seats += seat + " ";
		}
		setSeats(seats);
	}
	public String getSeats() {
		return seats;
	}
	public void setSeats(String seats) {
		this.seats = seats;
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
}
