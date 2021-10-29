package com.kh.project.reservation.service;

import java.util.List;

import com.kh.project.movie.vo.MovieVO;
import com.kh.project.reservation.vo.MovieTimeVO;
import com.kh.project.reservation.vo.TheaterVO;

public interface ReservationService {
	
	//영화관 조회
	List<TheaterVO> selectArea();	
	
	//상영중인 영화 조회
	List<MovieVO> selectMovieState();
	
	//상영가능한 상영관 조회
	List<TheaterVO> selectUseTheater();
	
	//상영등록해주기
	void insertMovieTime(MovieTimeVO movieTimeVO);
	
	//상영시간표 목록 띄우기
	List<MovieTimeVO> selectMovieTime();
	
	//상영등록)선택한 영화 정보 불러오기
	MovieVO selectMovieInfoAjax(String mvCode);
	
}
