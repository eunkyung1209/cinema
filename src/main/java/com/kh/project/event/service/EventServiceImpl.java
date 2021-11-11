package com.kh.project.event.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.event.vo.EventVO;

@Service("eventService")
public class EventServiceImpl implements EventService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<EventVO> selectEventAjax(EventVO eventVO) {
		
		return sqlSession.selectList("eventMapper.selectEventAjax",eventVO);
	}

	@Override
	public List<EventVO> selectEvent() {
		
		return sqlSession.selectList("eventMapper.selectEvent");
	}
	
}