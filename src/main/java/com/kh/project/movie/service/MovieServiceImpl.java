package com.kh.project.movie.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.movie.vo.MovieVO;

@Service("movieService")
public class MovieServiceImpl implements MovieService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//영화 목록 조회(심플)
	@Override
	public List<MovieVO> selectSimpleMovieList() {
		return sqlSession.selectList("movieMapper.selectSimpleMovieList");
	}
	
	//영화 목록 조회(상세)
	@Override
	public List<MovieVO> selectDetailMovieList() {
		return sqlSession.selectList("movieMapper.selectDetailMovieList");
	}
	
	//다음 MV_CODE를 조회
	@Override
	public String selectNextMovieCode() {
		return sqlSession.selectOne("movieMapper.selectNextMovieCode");
	}
	
	//영화 등록
	@Override
	public void insertMovie(MovieVO movieVO) {
		sqlSession.insert("movieMapper.insertMovie", movieVO);
	}
	
}
