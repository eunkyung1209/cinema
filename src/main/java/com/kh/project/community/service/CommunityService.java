package com.kh.project.community.service;

import java.util.List;

import com.kh.project.community.vo.CommunityReplyVO;
import com.kh.project.community.vo.CommunityVO;

public interface CommunityService {
	
	// 게시글 조회
	List<CommunityVO> selectBoardList();

	// 게시글 등록
	void insertBoard(CommunityVO communityVO);
	
	//게시글 상세보기 조회
	CommunityVO selectBoardDetail(CommunityVO communityVO);
	
	//댓글 조회
	List<CommunityReplyVO>selectReply(CommunityReplyVO communityReplyVO);
	
	//댓글등록
	void insertReply(CommunityReplyVO communityReplyVO);
	
	// 게시글 삭제
	void deleteBoard(CommunityVO communityVO);
		
	// 게시글 수정
	void updateBoard(CommunityVO communityVO);
		
	// 게시글 조회수
	void updateReadcnt(CommunityVO communityVO);
		
	
	// 페이징
	List<CommunityVO> pageBoardList(CommunityVO communityVO);
	
	//페이징 숫자
	int selectCommuPageCnt(CommunityVO communityVO);
	
	
	
}