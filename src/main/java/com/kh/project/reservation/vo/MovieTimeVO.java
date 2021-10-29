package com.kh.project.reservation.vo;

public class MovieTimeVO {

		private String mvTimeCode;
	    private String theaterCode;
	    private String areaName;
	    private String screenDay;
	    private String screenTime;
	    private String mvCode;
	    private String runningTime;
	    private String title;
	    private String[] days;
	    private String screenEndTime;
	    
	    private int seatAll;
        private int seatCnt;
        private String theaterName;
        private String isFullTheater;
        
		public String getScreenEndTime() {
			return screenEndTime;
		}
		public void setScreenEndTime(String screenEndTime) {
			this.screenEndTime = screenEndTime;
		}
		public int getSeatAll() {
			return seatAll;
		}
		public void setSeatAll(int seatAll) {
			this.seatAll = seatAll;
		}
		public int getSeatCnt() {
			return seatCnt;
		}
		public void setSeatCnt(int seatCnt) {
			this.seatCnt = seatCnt;
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
		public String[] getDays() {
			return days;
		}
		public void setDays(String[] days) {
			String screenDay = days[0];
			setScreenDay(screenDay);
			
			String screenTime = days[0] + " " + days[1];
			setScreenTime(screenTime);
		}
		public String getMvTimeCode() {
			return mvTimeCode;
		}
		public void setMvTimeCode(String mvTimeCode) {
			this.mvTimeCode = mvTimeCode;
		}
		public String getTheaterCode() {
			return theaterCode;
		}
		public void setTheaterCode(String theaterCode) {
			this.theaterCode = theaterCode;
		}
		public String getAreaName() {
			return areaName;
		}
		public void setAreaName(String areaName) {
			this.areaName = areaName;
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
		public String getMvCode() {
			return mvCode;
		}
		public void setMvCode(String mvCode) {
			this.mvCode = mvCode;
		}
		public String getRunningTime() {
			return runningTime;
		}
		public void setRunningTime(String runningTime) {
			this.runningTime = runningTime;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		} 
	
	    
	    
	    
	
}
