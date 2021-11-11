package com.kh.project.reservation.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.project.common.util.NowDateTime;
import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.MemberVO;
import com.kh.project.movie.vo.MovieVO;
import com.kh.project.reservation.service.ReservationService;
import com.kh.project.reservation.vo.MovieTimeVO;
import com.kh.project.reservation.vo.ReservationVO;
import com.kh.project.reservation.vo.TheaterVO;

//import 확인
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	//예매 관련 기능 구현
	
	@Resource(name = "reservationService")
	private ReservationService reservationService;
	
	@Resource(name = "memberService")
	private MemberService memberservice;
	
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
		//오늘 날짜
		model.addAttribute("nowDate", NowDateTime.getNowDate());	
		
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
			//오늘 날짜를 세팅
			movieTimeVO.setScreenDay(NowDateTime.getNowDate());
			
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
		
		//좌석선택 페이지로 이동(무비 타임 코드를 가지고,,)
		@GetMapping("/seatChoice")
		public String seatChoice(String mvTimeCode, MovieTimeVO movieTimeVO, Model model) {
			movieTimeVO.setMvTimeCode(mvTimeCode);
			
			//좌석을 선택할 때) 예매한 영화 정보
			model.addAttribute("mvInfo", reservationService.selectMovieInfoForSeat(movieTimeVO));
			
			return "reservation/seat_choice";
		}
		
		
		
		//결제페이지로 이동
		@GetMapping("/payMent")
		public String goPayMent(Model model, MovieTimeVO movieTimeVO, ReservationVO reservationVO, HttpSession session, MemberVO memberVO) {
			
			
			//선택한 상영시간표 정보
			model.addAttribute("mvtInfo", reservationService.selectReservationInfoBeforePay(movieTimeVO));
			//선택한 좌석 정보
			model.addAttribute("seatInfo", reservationVO);
			
			//로그인 정보에서 id값 가져오기
			String id = ((MemberVO)(session.getAttribute("loginInfo"))).getId();
			memberVO.setId(id);
			
			//예매할 회원 정보
			model.addAttribute("memberInfo", memberservice.selectMemberDetail(memberVO));
			
			
			return "reservation/payment_page";
		}
		
		//다음 예매코드 조회
		@ResponseBody	//에이작스
		@GetMapping("/selectNextResCodeAjax")
		public String selectNextResCodeAjax(ReservationVO reservationVO) {
			return reservationService.selectNextResCodeAjax(reservationVO);
		}
		
		//예매내역 등록
		@ResponseBody	//에이작스
		@PostMapping("/insertReservationAjax")
		public int insertReservationAjax(ReservationVO reservationVO) {
			return reservationService.insertReservationAjax(reservationVO);
		}
		
		//결제완료 페이지로 이동
		@GetMapping("/payComplete")
		public String goPayComplete(Model model, ReservationVO reservationVO, String seatName, String seatCnt, String theaterCode) {
			
			//예매내역 정보
			model.addAttribute("resInfo", reservationService.selectDetailReservation(reservationVO));
			reservationVO.setSeatName(seatName);
			reservationVO.setSeatCnt(Integer.parseInt(seatCnt));
			reservationVO.setTheaterCode(theaterCode);
			
			System.out.println("싯 네임" + reservationVO.getSeatName());
			System.out.println("싯 씨엔티" + reservationVO.getSeatCnt());
			System.out.println("씨어터 코드" + reservationVO.getTheaterCode());
			
			
			//좌석이름 'A1, A2, A3' 이런식으로 잘 넘어오나 확인!
			//-> 선택한 좌석을 ReservationVO의 seatNames[]로 받고, seatName에도 잘 담김!
//			List<String> seatCodeList = new ArrayList<String>();
//			for(String e : reservationVO.getSeatNames()) {
//				seatCodeList.add(reservationVO.getTheaterCode() +"_"  + e);
//			}
//			
//			ReservationVO vo = new ReservationVO();
//			vo.setSeatCodeList(seatCodeList);
			
			//상영관 좌석 y로 변경
			//reservationService.updateSeatStatus(vo);
			//상영관 잔여좌석 업데이트
			reservationService.updateSeatCnt(reservationVO);
			
			return "reservation/payment_complete";
		}
		
		//나의 예매내역 페이지로 이동
		@GetMapping("/goMyReservation")
		public String goMyReservation(String id, Model model) {
			
			//예매내역 리스트
			model.addAttribute("myReserveList", reservationService.selectMyReservation(id));
			
			return "reservation/my_reservation";
		}
		
		
		//카피
		@GetMapping("/write")
		public String copy() {
			
			return "reservation/write";
		}
		
		
		
		
		
		
		
		
}
