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
	
	//영화 목록 조회
	@Override
	public List<MovieVO> selectMovieList() {
		return sqlSession.selectList("movieMapper.selectMovieList");
	}
	
}
