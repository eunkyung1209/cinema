package com.kh.project.community.service;

import java.util.List;

import com.kh.project.community.vo.CommunityReplyVO;
import com.kh.project.community.vo.CommunityVO;

public interface CommunityService {
	
	// 게시글 조회
	List<CommunityVO>selectBoardList();
	
	// 게시글 등록
	void insertBoard(CommunityVO communityVO);
	
	// 게시글 삭제
	void deleteBoard(String commuCode);
	
	// 게시글 수정

}
