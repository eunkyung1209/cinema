package com.kh.project.common.util;

import java.util.Calendar;

public class NowDateTime {
	
	//현재 일시 - 메인화면에 띄울 날짜와 시간을 문자열로 리턴
	public static String getNowDateTime() {
		//캘린더 객체 생성
		Calendar cal = Calendar.getInstance();
		
		//현재 날짜 및 시간을 문자열로 저장할 변수 생성
		String nowDateTime = "";	//형식 : MM.dd HH:mm
		
		//현재 날짜 및 시간을 문자열로 생성
		nowDateTime += cal.get(Calendar.MONTH) + 1;
		nowDateTime += ".";
		nowDateTime += cal.get(Calendar.DATE);
		nowDateTime += " ";
		nowDateTime += cal.get(Calendar.HOUR_OF_DAY);
		nowDateTime += ":";
		nowDateTime += cal.get(Calendar.MINUTE);
		
		return nowDateTime;
	}
	
}
