package com.kh.project.reservation.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.reservation.service.ReservationService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	//예매 관련 기능 구현
	
	@Resource(name = "reservationService")
	private ReservationService reservationService;
	
	//1. 회원가입 페이지 가기
	@GetMapping("/screeningSchedule")
	public String screeningSchedule() {
		return "reservation/screening_schedule";
	}
		
		
}
