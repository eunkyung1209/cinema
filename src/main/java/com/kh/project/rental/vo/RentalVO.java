package com.kh.project.rental.vo;

import com.kh.project.common.vo.PageVO;

public class RentalVO extends PageVO {
	private String rtCode;
	private String areaCode;
	private String theaterCode;
	private String rtDate;
	private String rtStartTime;
	private String rtEndTime;
	private String mvCode;
	private String id;
	private String isComplete;
	
	private String areaName;
	private String loc;
	private String theaterName;
	private String title;
	
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	
	public String getRtCode() {
		return rtCode;
	}
	public void setRtCode(String rtCode) {
		this.rtCode = rtCode;
	}
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public String getTheaterCode() {
		return theaterCode;
	}
	public void setTheaterCode(String theaterCode) {
		this.theaterCode = theaterCode;
	}
	public String getRtDate() {
		return rtDate;
	}
	public void setRtDate(String rtDate) {
		this.rtDate = rtDate;
	}
	public String getRtStartTime() {
		return rtStartTime;
	}
	public void setRtStartTime(String rtStartTime) {
		this.rtStartTime = rtStartTime;
	}
	public String getRtEndTime() {
		return rtEndTime;
	}
	public void setRtEndTime(String rtEndTime) {
		this.rtEndTime = rtEndTime;
	}
	public String getMvCode() {
		return mvCode;
	}
	public void setMvCode(String mvCode) {
		this.mvCode = mvCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIsComplete() {
		return isComplete;
	}
	public void setIsComplete(String isComplete) {
		this.isComplete = isComplete;
	}
}
