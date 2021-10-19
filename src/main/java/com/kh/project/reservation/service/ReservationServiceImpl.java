package com.kh.project.reservation.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("reservationService")
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
