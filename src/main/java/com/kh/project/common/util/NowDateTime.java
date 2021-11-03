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
		//month
		if((cal.get(Calendar.MONTH) + 1) / 10 == 0) {	//달 - 1자리
			nowDateTime += "0" + cal.get(Calendar.MONTH) + 1;
		}
		else {	//달 - 2자리
			nowDateTime += cal.get(Calendar.MONTH) + 1;
		}
		nowDateTime += ".";
		//date
		if((cal.get(Calendar.DATE)) / 10 == 0) {	//일 - 1자리
			nowDateTime += "0" + cal.get(Calendar.DATE);
		}
		else {	//일 - 2자리
			nowDateTime += cal.get(Calendar.DATE);
		}
		nowDateTime += " ";
		//hour
		if((cal.get(Calendar.HOUR_OF_DAY)) / 10 == 0) {	//시간 - 1자리
			nowDateTime += "0" + cal.get(Calendar.HOUR_OF_DAY);
		}
		else {	//시간 - 2자리
			nowDateTime += cal.get(Calendar.HOUR_OF_DAY);
		}
		nowDateTime += ":";
		//minute
		if((cal.get(Calendar.MINUTE)) / 10 == 0) {	//분 - 1자리
			nowDateTime += "0" + cal.get(Calendar.MINUTE);
		}
		else {	//분 - 2자리
			nowDateTime += cal.get(Calendar.MINUTE);
		}
		
		return nowDateTime;
	}
	
	//오늘 날짜 - 대관 예약 페이지에 대관 예약일 기본값을 문자열로 리턴
	public static String getNowDate() {
		//캘린더 객체 생성
		Calendar cal = Calendar.getInstance();
		
		//현재 날짜 및 시간을 문자열로 저장할 변수 생성
		String nowDate = "";	//형식 : YYYY-MM-dd
		
		//현재 날짜 및 시간을 문자열로 생성
		nowDate += cal.get(Calendar.YEAR);
		nowDate += "-";
		if((cal.get(Calendar.MONTH) + 1) / 10 == 0) {	//1자리
			nowDate += "0" + cal.get(Calendar.MONTH) + 1;
		}
		else {
			nowDate += cal.get(Calendar.MONTH) + 1;
		}
		nowDate += "-";
		if((cal.get(Calendar.DATE)) / 10 == 0) {	//1자리
			nowDate += "0" + cal.get(Calendar.DATE);
		}
		else {	//2자리
			nowDate += cal.get(Calendar.DATE);
		}
		
		return nowDate;
	}
	
}
