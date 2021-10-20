package com.kh.project.movie.vo;

import java.util.List;

//영화
public class MovieVO {
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
	private int grade;
	
	private List<MovieImgVO> posterList;	//영화 포스터 이미지 리스트
	
	public List<MovieImgVO> getPosterList() {
		return posterList;
	}
	public void setPosterList(List<MovieImgVO> posterList) {
		this.posterList = posterList;
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
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
}
