package com.kh.project.reservation.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String screeningSchedule(Model model, MovieTimeVO movieTimeVO) {
		
		//영화관리스트 보내주기
		model.addAttribute("areaList", reservationService.selectArea());
		//상영시간표 목록 보내주기
		model.addAttribute("movieTimeList", reservationService.selectMovieTime(movieTimeVO));
		//상영 중인 초기 영화 리스트
		model.addAttribute("statingMovieList", reservationService.selectMovieState1());
		//상영중인 영화리스트
		model.addAttribute("statingMovieList2", reservationService.selectMovieState2(movieTimeVO));
		
		
		return "reservation/reserve_form";
	}
	
	//영화 상영 등록페이지로 이동
		@GetMapping("/goRegMovieTime")
		public String goRegMovieTime(Model model, MovieTimeVO movieTimeVO) {
			
			//상영 중인 초기 영화 리스트
			model.addAttribute("statingMovieList", reservationService.selectMovieState1());
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
		
		//영화관에 따른 상영시간표를 ajax로 조회
		@ResponseBody
		@PostMapping("/selectMovieTimeAjax1")
		public List<MovieTimeVO> selectMovieTimeAjax1(MovieTimeVO movieTimeVO) {
			
			return reservationService.selectMovieTime(movieTimeVO);
		}
		
		//영화관에 따른 영화 조회
		@ResponseBody
		@PostMapping("/selectMovieTimeAjax2")
		public List<MovieVO> selectMovieTimeAjax2(MovieTimeVO movieTimeVO) {
			
			//영화 조회(2)
			return reservationService.selectMovieState2(movieTimeVO);
			
		}
		
		//영화관, 영화를 선택 후 상영시간표를 ajax로 조회
		@ResponseBody
		@PostMapping("/selectMovieTimeAjax3")
		public List<MovieTimeVO> selectMovieTimeAjax3(MovieTimeVO movieTimeVO) {
			
			//영화 시간표 조회
			return reservationService.selectMovieTime(movieTimeVO);
			
		}
		
}
