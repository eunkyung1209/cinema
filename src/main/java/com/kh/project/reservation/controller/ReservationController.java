package com.kh.project.reservation.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.reservation.service.ReservationService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	//예매 관련 기능 구현
	
	@Resource(name = "reservationService")
	private ReservationService reservationService;
	
	//예매하기 페이지로 이동
	@GetMapping("/goReserve")
	public String screeningSchedule(Model model) {
		
		//영화관리스트 보내주기
		model.addAttribute("areaList", reservationService.selectArea());
		//상영시간표 목록 보내주기
		model.addAttribute("movieTimeList", reservationService.selectMovieTime());
		
		
		return "reservation/reserve_form";
	}
		
		
}
