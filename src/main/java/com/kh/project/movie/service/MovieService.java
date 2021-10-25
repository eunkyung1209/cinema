package com.kh.project.movie.service;

import java.util.List;

import com.kh.project.movie.vo.MovieImgVO;
import com.kh.project.movie.vo.MovieReplyVO;
import com.kh.project.movie.vo.MovieVO;

public interface MovieService {
	
	//영화 목록 조회 - 메인화면, 영화목록
	List<MovieVO> selectMovieList();
	
	//영화 상세 조회
	MovieVO selectDetailMovie(String mvCode);
	
	//댓글 목록 조회
	List<MovieReplyVO> selectReplyList(String mvCode);
	
	//영화 목록 조회 - 관리자
	List<MovieVO> selectAdminMovieList();
	
	//영화 삭제
	void deleteMovie(String mvCode);
	
	//다음 MV_CODE를 조회
	String selectNextMovieCode();
	
	//영화 등록
	void insertMovie(MovieVO movieVO);
	
	//다음 MOVIE_IMG_CODE를 조회
	String selectNextImgCode();
	
	//영화 포스터 이미지 등록
	void insertImage(MovieImgVO movieImgVO);
	
	//댓글 등록
	void insertReply(MovieReplyVO movieReplyVO);
	
	//영화 평점 수정
	void updateGrade(String mvCode);
	
}
