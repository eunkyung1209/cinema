package com.kh.project.reservation.vo;

import java.util.List;

public class TheaterVO {
	
		//영화관
	    private String areaCode;
	    private String areaName; 
	    private String teaterCnt; 
	    private String loc ;
	    //상영관
	    private String theaterCode;
	    private int seatAll;
	    private String theaterName;
	    private String isFullTheater;
	    //좌석
	    private String seatCode;
	    private String rowNum;
	    private String colNum;
	    private String useSeat;
	    private int seatCnt;
	    private String useTheater;
	    private int seatLeft;
	    private List<String> seatCodeList;
	    
	    
	    
		public List<String> getSeatCodeList() {
			return seatCodeList;
		}
		public void setSeatCodeList(List<String> seatCodeList) {
			this.seatCodeList = seatCodeList;
		}
		public int getSeatLeft() {
			return seatLeft;
		}
		public void setSeatLeft(int seatCnt, int seatAll) {
			this.seatLeft = seatAll - seatCnt;
		}
		public String getUseTheater() {
			return useTheater;
		}
		public void setUseTheater(String useTheater) {
			this.useTheater = useTheater;
		}
		public int getSeatAll() {
			return seatAll;
		}
		public void setSeatAll(int seatAll) {
			this.seatAll = seatAll;
		}
		public String getSeatCode() {
			return seatCode;
		}
		public void setSeatCode(String seatCode) {
			this.seatCode = seatCode;
		}
		public String getRowNum() {
			return rowNum;
		}
		public void setRowNum(String rowNum) {
			this.rowNum = rowNum;
		}
		public String getColNum() {
			return colNum;
		}
		public void setColNum(String colNum) {
			this.colNum = colNum;
		}
		public String getUseSeat() {
			return useSeat;
		}
		public void setUseSeat(String useSeat) {
			this.useSeat = useSeat;
		}
		public int getSeatCnt() {
			return seatCnt;
		}
		public void setSeatCnt(int seatCnt) {
			this.seatCnt = seatCnt;
		}
		public String getTheaterCode() {
			return theaterCode;
		}
		public void setTheaterCode(String theaterCode) {
			this.theaterCode = theaterCode;
		}
		public String getTheaterName() {
			return theaterName;
		}
		public void setTheaterName(String theaterName) {
			this.theaterName = theaterName;
		}
		public String getIsFullTheater() {
			return isFullTheater;
		}
		public void setIsFullTheater(String isFullTheater) {
			this.isFullTheater = isFullTheater;
		}
		public String getAreaCode() {
			return areaCode;
		}
		public void setAreaCode(String areaCode) {
			this.areaCode = areaCode;
		}
		public String getAreaName() {
			return areaName;
		}
		public void setAreaName(String areaName) {
			this.areaName = areaName;
		}
		public String getTeaterCnt() {
			return teaterCnt;
		}
		public void setTeaterCnt(String teaterCnt) {
			this.teaterCnt = teaterCnt;
		}
		public String getLoc() {
			return loc;
		}
		public void setLoc(String loc) {
			this.loc = loc;
		}
	
	
}
