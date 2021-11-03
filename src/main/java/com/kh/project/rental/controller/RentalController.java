package com.kh.project.rental.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.common.util.NowDateTime;
import com.kh.project.rental.service.RentalService;
import com.kh.project.rental.vo.RentalVO;

@Controller
@RequestMapping("/rental")
public class RentalController {
	//상영관 대여 관련 기능
	
	@Resource(name = "rentalService")
	private RentalService rentalService;
	
	//대관 예약 신청 페이지로 이동
	@GetMapping("/goApplyRental")
	public String goApplyRental(Model model) {
		//오늘 날짜
		model.addAttribute("nowDate", NowDateTime.getNowDate());
		
		return "rental/apply_rental";
	}
	
	//대관 예약
	@PostMapping("/applyRental")
	public String applyRental(RentalVO rentalVO) {
		//대관 예약
		
		return "redirect:/rental/goApplyRental";
	}
	
	//대관 예약 조회 페이지로 이동
	@GetMapping("/selectRentalList")
	public String selectRentalList() {
		//대관 예약 목록 조회
		
		return "rental/rental_list";
	}
	
	//대관 예약 관리 페이지로 이동
	@GetMapping("/rentalManage")
	public String rentalManage() {
		//대관 예약 목록 조회
		
		return "rental/rental_manage";
	}
	
}
