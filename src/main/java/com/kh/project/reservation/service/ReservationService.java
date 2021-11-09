package com.kh.project.reservation.service;

import java.util.List;

import com.kh.project.movie.vo.MovieVO;
import com.kh.project.reservation.vo.MovieTimeVO;
import com.kh.project.reservation.vo.ReservationVO;
import com.kh.project.reservation.vo.TheaterVO;

public interface ReservationService {
	
	//영화관 조회
	List<TheaterVO> selectArea();	
	
	//상영중인 영화 초기 조회
	List<MovieVO> selectMovieState1();
	
	//상영중인 영화 조회
	List<MovieVO> selectMovieState2(MovieTimeVO movieTimeVO);
	
	//상영등록해주기
	void insertMovieTime(MovieTimeVO movieTimeVO);
	
	//상영시간표 목록 띄우기
	List<MovieTimeVO> selectMovieTime(MovieTimeVO movieTimeVO);
	
	//상영등록)선택한 영화 정보 불러오기
	MovieVO selectMovieInfoAjax(String mvCode);
	
	//상영가능한 상영관 조회
	List<TheaterVO> selectUseTheaterAjax(String areaName);
	
	//좌석을 선택할 때) 예매한 영화 정보
	MovieTimeVO selectMovieInfoForSeat(MovieTimeVO movieTimeVO);
	
	
	
	
	
	//결제 페이지로 이동할 때) 예매할 티켓과 관련된 정보 : 상영시간 테이블
	MovieTimeVO selectReservationInfoBeforePay(MovieTimeVO movieTimeVO);
	
	//예매내역 등록
	int insertReservationAjax(ReservationVO reservationVO);
	
}
