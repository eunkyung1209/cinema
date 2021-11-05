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

	//상영 중인 초기 영화목록 조회
	@Override
	public List<MovieVO> selectMovieState1() {
		return sqlSession.selectList("reservationMapper.selectMovieState1");
	}
	
	
	//상영 중인 영화 목록 조회
	@Override
	public List<MovieVO> selectMovieState2(MovieTimeVO movieTimeVO) {
		return sqlSession.selectList("reservationMapper.selectMovieState2", movieTimeVO);
	}


	//상영등록해주기
	@Override
	public void insertMovieTime(MovieTimeVO movieTimeVO) {
		 sqlSession.insert("reservationMapper.insertMovieTime", movieTimeVO);
	}

	//상영시간표 조회
	@Override
	public List<MovieTimeVO> selectMovieTime(MovieTimeVO movieTimeVO) {
		return sqlSession.selectList("reservationMapper.selectMovieTime", movieTimeVO);
	}

	//상영등록)선택한 영화 정보 불러오기
	@Override
	public MovieVO selectMovieInfoAjax(String mvCode) {
		return sqlSession.selectOne("reservationMapper.selectMovieInfoAjax", mvCode);
	}
	
	//상영등록) 사용가능한 상영관 조회
		@Override
		public List<TheaterVO> selectUseTheaterAjax(String areaName) {
			return sqlSession.selectList("reservationMapper.selectUseTheaterAjax", areaName);
		}

		//좌석을 선택할 때) 예매한 영화 정보
		@Override
		public MovieTimeVO selectMovieInfoForSeat(MovieTimeVO movieTimeVO) {
			return sqlSession.selectOne("reservationMapper.selectMovieInfoForSeat", movieTimeVO);
		}

		
	
	
}
