package com.kh.project.movie.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.movie.vo.MovieImgVO;
import com.kh.project.movie.vo.MovieReplyVO;
import com.kh.project.movie.vo.MovieVO;

@Service("movieService")
public class MovieServiceImpl implements MovieService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//영화 목록 조회 - 메인화면, 영화목록
	@Override
	public List<MovieVO> selectMovieList(MovieVO movieVO) {
		return sqlSession.selectList("movieMapper.selectMovieList", movieVO);
	}
	
	//영화 상세 조회
	@Override
	public MovieVO selectDetailMovie(MovieVO movieVO) {
		return sqlSession.selectOne("movieMapper.selectDetailMovie", movieVO);
	}
	
	//댓글 목록 조회
	@Override
	public List<MovieReplyVO> selectReplyList(MovieVO movieVO) {
		return sqlSession.selectList("movieMapper.selectReplyList", movieVO);
	}
	
	//영화 목록 조회 - 관리자
	@Override
	public List<MovieVO> selectAdminMovieList(MovieVO movieVO) {
		return sqlSession.selectList("movieMapper.selectAdminMovieList", movieVO);
	}
	
	//영화 삭제
	@Override
	public void deleteMovie(MovieVO movieVO) {
		sqlSession.delete("movieMapper.deleteMovie", movieVO);
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
	
	//다음 MOVIE_IMG_CODE를 조회
	@Override
	public String selectNextImgCode() {
		return sqlSession.selectOne("movieMapper.selectNextImgCode");
	}
	
	//영화 포스터 이미지 등록
	@Override
	public void insertImage(MovieImgVO movieImgVO) {
		sqlSession.insert("movieMapper.insertImage", movieImgVO);
	}
	
	//댓글 등록
	@Override
	public void insertReply(MovieReplyVO movieReplyVO) {
		sqlSession.insert("movieMapper.insertReply", movieReplyVO);
	}
	
	//영화 평점 수정
	@Override
	public void updateGrade(MovieReplyVO movieReplyVO) {
		sqlSession.update("movieMapper.updateGrade", movieReplyVO);
	}
	
	//영화 정보 수정
	@Override
	public void updateMovie(MovieVO movieVO) {
		sqlSession.update("movieMapper.updateMovie", movieVO);
	}
	
}
