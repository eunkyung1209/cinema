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
	
	//다음 예매코드 조회
	String selectNextResCodeAjax(ReservationVO reservationVO);
	
	//예매내역 등록
	int insertReservationAjax(ReservationVO reservationVO);
	
	//결제한 예매내역 조회
	ReservationVO selectDetailReservation(ReservationVO reservationVO);
	
	//나의 예매내역 조회
	List<ReservationVO> selectMyReservation(String id);
	
	//좌석 상태 Y로 변경
	void updateSeatStatus(ReservationVO reservationVO);
	
	//잔여좌석 업데이트
	void updateSeatCnt(ReservationVO reservationVO);
	
	
}
