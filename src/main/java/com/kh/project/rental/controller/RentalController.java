package com.kh.project.rental.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.rental.service.RentalService;

@Controller
@RequestMapping("/rental")
public class RentalController {
	//상영관 대여 관련 기능
	
	@Resource(name = "rentalService")
	private RentalService rentalService;
	
	//대관 신청
	@GetMapping("/goApplyRental")
	public String goApplyRental() {
		//대관 일정 목록 조회
		
		return "rental/apply_rental";
	}
	
	//대관 일정
	@GetMapping("/goRentalSchedule")
	public String goRentalSchedule() {
		//대관 일정 목록 조회
		
		return "rental/rental_schedule";
	}
	
}
