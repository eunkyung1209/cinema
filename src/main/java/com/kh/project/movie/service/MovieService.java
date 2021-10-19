package com.kh.project.movie.service;

import java.util.List;

import com.kh.project.movie.vo.MovieVO;

public interface MovieService {
	
	//영화 목록 조회
	List<MovieVO> selectMovieList();
	
}
