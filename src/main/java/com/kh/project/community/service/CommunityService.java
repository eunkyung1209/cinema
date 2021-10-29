package com.kh.project.community.service;

import java.util.List;

import com.kh.project.community.vo.CommunityReplyVO;
import com.kh.project.community.vo.CommunityVO;
import com.kh.project.member.vo.MemberVO;

public interface CommunityService {
	
	//1. 게시글 조회
	List<CommunityVO> selectCommuList(CommunityVO communityVO);
	
	//1-1. 게시글 페이징
	int selectCommuCnt(CommunityVO communityVO);
	
	//1-2. 조회수 증가
	void updaterReadCnt(int commuCode);
	
	//2. 게시글 글 등록하기
	void insertCommu(CommunityVO communityVO);
	
	//3. 게시글 상세 조회
	CommunityVO selectCommuDetail(String commuCode);
	
	
	

//	// 게시글 등록
//	void insertBoard(CommunityVO communityVO);
//	
//	//게시글 상세보기 조회
//	CommunityVO selectBoardDetail(CommunityVO communityVO);
//	
//	//댓글 조회
//	List<CommunityReplyVO>selectReply(CommunityReplyVO communityReplyVO);
//	
//	//댓글등록
//	void insertReply(CommunityReplyVO communityReplyVO);
//	
//	// 게시글 삭제
//	void deleteBoard(CommunityVO communityVO);
//		
//	// 게시글 수정
//	void updateBoard(CommunityVO communityVO);
//		
//	// 게시글 조회수
//	void updateReadcnt(CommunityVO communityVO);
		
	
	
	
	
	
}