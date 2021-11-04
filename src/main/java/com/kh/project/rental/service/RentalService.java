package com.kh.project.rental.service;

import java.util.List;

import com.kh.project.movie.vo.MovieVO;
import com.kh.project.rental.vo.RentalVO;
import com.kh.project.reservation.vo.TheaterVO;

public interface RentalService {
	
	//영화관 목록 조회
	List<TheaterVO> selectAreaList();
	
	//영화 목록 조회
	List<MovieVO> selectMovieList();
	
	//대관 예약 등록
	void insertRental(RentalVO rentalVO);
	
	//대관 예약 목록 조회 - 일반회원
	List<RentalVO> selectRentalList(RentalVO rentalVO);
	
	//대관 예약 목록 조회 - 관리자
	List<RentalVO> selectAdminRentalList(RentalVO rentalVO);
	
	//대관 예약정보 수정
	void updateRental(RentalVO rentalVO);
	
}
