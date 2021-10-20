package com.kh.project.movie.service;

import java.util.List;

import com.kh.project.movie.vo.MovieVO;

public interface MovieService {
	
	//영화 목록 조회(심플)
	List<MovieVO> selectSimpleMovieList();
	
	//영화 목록 조회(상세)
	List<MovieVO> selectDetailMovieList();
	
	//다음 MV_CODE를 조회
	String selectNextMovieCode();
	
	//영화 등록
	void insertMovie(MovieVO movieVO);
	
}
