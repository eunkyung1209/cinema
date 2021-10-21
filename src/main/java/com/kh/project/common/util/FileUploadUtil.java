package com.kh.project.common.util;

import java.util.Calendar;

public class FileUploadUtil {
	//첨부파일 등록할 때, 저번에는 같은 파일명이 존재하면 파일명 뒤에 숫자를 붙이는 형식으로 만들었음
	//근데 일반적으로는 파일을 등록하는 시간과 관련한 이름으로 파일명을 변경해서 올림
	//그래서 현재 날짜와 시간을 문자열로 리턴하는 메소드를 만들 것임!
	
	//현재 날짜와 시간을 문자열로 리턴
	public static String getNowDateTime() {
		//캘린더 객체 생성
		Calendar cal = Calendar.getInstance();
		//현재 날짜 및 시간을 문자열로 저장할 변수 생성
		String nowDateTime = "";
		//현재 날짜 및 시간을 문자열로 생성
		nowDateTime += cal.get(Calendar.YEAR);
		nowDateTime += cal.get(Calendar.MONTH) + 1;
		nowDateTime += cal.get(Calendar.DATE);
		nowDateTime += "_";
		nowDateTime += cal.get(Calendar.HOUR);
		nowDateTime += cal.get(Calendar.MINUTE);
		nowDateTime += cal.get(Calendar.SECOND);
		nowDateTime += cal.get(Calendar.MILLISECOND);
		
		return nowDateTime;
	}
}
