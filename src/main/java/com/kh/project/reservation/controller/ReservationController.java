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
	
	//
	@GetMapping("/goReserve")
	public String screeningSchedule() {
		return "reservation/reserve_form";
	}
		
		
}
