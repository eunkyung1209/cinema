package com.kh.project.movie.vo;

import java.util.List;

import com.kh.project.common.vo.PageVO;

//영화
public class MovieVO extends PageVO {
	private String mvCode;
	private String title;
	private String director;
	private String actor;
	private String genre;
	private int age;
	private int runningTime;
	private String nation;
	private String openDate;
	private String content;
	private String mvState;
	private double grade;
	private List<MovieImgVO> imgList;
	private String attachedImgName;
	
	public String getAttachedImgName() {
		return attachedImgName;
	}
	public void setAttachedImgName(String attachedImgName) {
		this.attachedImgName = attachedImgName;
	}
	
	public List<MovieImgVO> getImgList() {
		return imgList;
	}
	public void setImgList(List<MovieImgVO> imgList) {
		this.imgList = imgList;
	}
	
	public String getMvCode() {
		return mvCode;
	}
	public void setMvCode(String mvCode) {
		this.mvCode = mvCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getRunningTime() {
		return runningTime;
	}
	public void setRunningTime(int runningTime) {
		this.runningTime = runningTime;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getOpenDate() {
		return openDate;
	}
	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMvState() {
		return mvState;
	}
	public void setMvState(String mvState) {
		this.mvState = mvState;
	}
	public double getGrade() {
		return Double.valueOf(String.format("%.2f", grade));
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	
}
