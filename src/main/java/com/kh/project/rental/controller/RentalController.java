package com.kh.project.rental.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.common.util.NowDateTime;
import com.kh.project.movie.service.MovieService;
import com.kh.project.movie.vo.MovieVO;
import com.kh.project.rental.service.RentalService;
import com.kh.project.rental.vo.RentalVO;
import com.kh.project.reservation.service.ReservationService;

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
		
		//영화관 목록
		model.addAttribute("areaList", rentalService.selectAreaList());
		
		//영화 목록
		model.addAttribute("movieList", rentalService.selectMovieList());
		
		return "rental/apply_rental";
	}
	
	//대관 예약
	@PostMapping("/applyRental")
	public String applyRental(RentalVO rentalVO, Model model) {
		//대관 예약
		rentalService.insertRental(rentalVO);
		
		//예약한 사람 id
		model.addAttribute("id", rentalVO.getId());
		
		return "redirect:/rental/selectRentalList";
	}
	
	//대관 예약 조회 페이지로 이동
	@GetMapping("/selectRentalList")
	public String selectRentalList(Model model, RentalVO rentalVO) {
		//회원 id
		model.addAttribute("id", rentalVO.getId());
		
		//영화관 목록
		model.addAttribute("areaList", rentalService.selectAreaList());
		
		//대관 예약 목록 조회
		model.addAttribute("rentalList", rentalService.selectRentalList(rentalVO));
		
		return "rental/rental_list";
	}
	
	
	
}
