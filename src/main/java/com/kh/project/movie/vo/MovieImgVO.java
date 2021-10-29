package com.kh.project.movie.vo;

//포스터 이미지 파일
public class MovieImgVO {
	private String movieImgCode;
	private String originImgName;
	private String attachedImgName;
	private String mvCode;
	private String isPoster;
	
	public String getIsPoster() {
		return isPoster;
	}
	public void setIsPoster(String isPoster) {
		this.isPoster = isPoster;
	}
	public String getMovieImgCode() {
		return movieImgCode;
	}
	public void setMovieImgCode(String movieImgCode) {
		this.movieImgCode = movieImgCode;
	}
	public String getOriginImgName() {
		return originImgName;
	}
	public void setOriginImgName(String originImgName) {
		this.originImgName = originImgName;
	}
	public String getAttachedImgName() {
		return attachedImgName;
	}
	public void setAttachedImgName(String attachedImgName) {
		this.attachedImgName = attachedImgName;
	}
	public String getMvCode() {
		return mvCode;
	}
	public void setMvCode(String mvCode) {
		this.mvCode = mvCode;
	}
}
