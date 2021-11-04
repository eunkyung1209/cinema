package com.kh.project.rental.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.movie.vo.MovieVO;
import com.kh.project.rental.vo.RentalVO;
import com.kh.project.reservation.vo.TheaterVO;

@Service("rentalService")
public class RentalServiceImpl implements RentalService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//영화관 목록 조회
	@Override
	public List<TheaterVO> selectAreaList() {
		return sqlSession.selectList("rentalMapper.selectAreaList");
	}
	
	//영화 목록 조회
	@Override
	public List<MovieVO> selectMovieList() {
		return sqlSession.selectList("rentalMapper.selectMovieList");
	}
	
	//대관 예약 등록
	@Override
	public void insertRental(RentalVO rentalVO) {
		sqlSession.insert("rentalMapper.insertRental", rentalVO);
	}
	
	//대관 예약 목록 조회
	@Override
	public List<RentalVO> selectRentalList(RentalVO rentalVO) {
		return sqlSession.selectList("rentalMapper.selectRentalList", rentalVO);
	}
	
}
