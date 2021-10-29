package com.kh.project.reservation.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.project.movie.vo.MovieVO;
import com.kh.project.reservation.service.ReservationService;
import com.kh.project.reservation.vo.MovieTimeVO;
import com.kh.project.reservation.vo.TheaterVO;

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
	
	//영화 상영 등록페이지로 이동
		@GetMapping("/goRegMovieTime")
		public String goRegMovieTime(Model model) {
			
			//상영중인 영화리스트
			model.addAttribute("statingMovieList", reservationService.selectMovieState());
			//영화관 조회
			model.addAttribute("areaList", reservationService.selectArea());
			
			return "admin/reg_movie_time";
		}
		
		//영화 상영페이지에 영화조회
		@ResponseBody
		@PostMapping("/selectMovieInfoAjax")
		public MovieVO selectMovieInfoAjax(String mvCode) {
			
			//영화정보 셀렉트
			return reservationService.selectMovieInfoAjax(mvCode);
		}
		
		//영화 상영등록페이지에 상영관조회
		@ResponseBody
		@PostMapping("/selectUseTheaterAjax")
		public List<TheaterVO> selectUseTheaterAjax(String areaName) {
			
			return reservationService.selectUseTheaterAjax(areaName);
		}
		
		
		//영화 상영 등록
		@PostMapping("/insertMovieTime")
		public String insertMovieTime(MovieTimeVO movieTimeVO) {
			
			//상영등록 쿼리
			reservationService.insertMovieTime(movieTimeVO);
			
			return "redirect:/movie/mainPage";
		}
		
}
