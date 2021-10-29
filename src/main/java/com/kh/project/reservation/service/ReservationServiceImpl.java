package com.kh.project.reservation.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.movie.vo.MovieVO;
import com.kh.project.reservation.vo.MovieTimeVO;
import com.kh.project.reservation.vo.TheaterVO;

@Service("reservationService")
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//영화관 조회
	@Override
	public List<TheaterVO> selectArea() {
		return sqlSession.selectList("reservationMapper.selectArea");
	}

	//상영 중인 영화 목록 조회
	@Override
	public List<MovieVO> selectMovieState() {
		return sqlSession.selectList("reservationMapper.selectMovieState");
	}

	//사용가능한 상영관 조회
	@Override
	public List<TheaterVO> selectUseTheater() {
		return sqlSession.selectList("reservationMapper.selectUseTheater");
	}

	//상영등록해주기
	@Override
	public void insertMovieTime(MovieTimeVO movieTimeVO) {
		 sqlSession.insert("reservationMapper.insertMovieTime", movieTimeVO);
	}

	//상영시간표 조회
	@Override
	public List<MovieTimeVO> selectMovieTime() {
		return sqlSession.selectList("reservationMapper.selectMovieTime");
	}

	//상영등록)선택한 영화 정보 불러오기
	@Override
	public MovieVO selectMovieInfoAjax(String mvCode) {
		return sqlSession.selectOne("reservationMapper.selectMovieInfoAjax", mvCode);
	}
	
	
	
}
