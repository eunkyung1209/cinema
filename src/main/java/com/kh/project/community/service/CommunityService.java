package com.kh.project.community.service;

import java.util.List;

import com.kh.project.community.vo.CommunityReplyVO;
import com.kh.project.community.vo.CommunityVO;
import com.kh.project.customerCenter.vo.CustomerCenterReplyVO;
import com.kh.project.member.vo.MemberVO;

public interface CommunityService {
	
	//1. 게시글 조회
	List<CommunityVO> selectCommuList(CommunityVO communityVO);
	
	//1-1. 게시글 페이징
	int selectCommuCnt(CommunityVO communityVO);
	
	//1-2. 조회수 증가
	void updaterReadCnt(String commuCode);
	
	//2. 게시글 글 등록하기
	void insertCommu(CommunityVO communityVO);
	
	//3. 게시글 상세 조회
	CommunityVO selectCommuDetail(CommunityVO communityVO);
	
	//3-1. 게시글 상세 수정
	void updateCommu(CommunityVO communityVO);
	
	//3-2. 게시글 상세 삭제
	void deleteCommu(String commuCode);
	
	//4.댓글 목록 조회
	List<CommunityReplyVO> selectCommuReply(String commuCode);
	
	//4-1. 댓글 등록 하기
	void insertCommuReply(CommunityReplyVO communityReplyVO);

	//댓글 수정
	void updateCummuReply(CommunityReplyVO communityReplyVO);
	
	//댓글 삭제
	void deleteCummuReply(String commuReplyCode);
	
	

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