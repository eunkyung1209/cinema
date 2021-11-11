package com.kh.project.event.service;

import java.util.List;

import com.kh.project.event.vo.EventVO;

public interface EventService {
	// 이벤트 전체조회
	List<EventVO> selectEvent();
	
	//해당일 이달의 행사일정 조회	
	List<EventVO> selectEventAjax(EventVO eventVO);
	

}
