package com.kh.project.community.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.community.vo.CommunityReplyVO;
import com.kh.project.community.vo.CommunityVO;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

//	// 게시글 목록화면
//	public List<CommunityVO> selectBoardList() {
//		return sqlSession.selectList("communityMapper.selectBoardList");
//	}
//
//	//게시글 등록화면
//	public void insertBoard(CommunityVO communityVO) {
//		sqlSession.insert("communityMapper.insertBoard",communityVO);
//	}
//
//	//게시글 삭제
//	public void deleteBoard(CommunityVO communityVO) {
//		sqlSession.delete("communityMapper.deleteBoard",communityVO);
//		
//	}
//
//	// 게시글 수정
//	public void updateBoard(CommunityVO communityVO) {
//		sqlSession.update("communityMapper.updateBoard",communityVO);
//		
//	}
//
//	// 게시글 상세보기
//	public CommunityVO selectBoardDetail(CommunityVO communityVO) {
//		return sqlSession.selectOne("communityMapper.selectBoardDetail",communityVO);
//	}
//
//	// 게시글 조회수
//	public void updateReadcnt(CommunityVO communityVO) {
//		
//		
//	}
//
//	// 댓글목록 조회
//	public List<CommunityReplyVO> selectReply(CommunityReplyVO communityReplyVO) {
//		
//		return sqlSession.selectList("communityMapper.selectReply",communityReplyVO);
//	}
//
//	// 댓글등록
//	public void insertReply(CommunityReplyVO communityReplyVO) {
//		sqlSession.insert("communityMapper.insertReply",communityReplyVO);
//		
//	}

	////////////////////////////////////////////////////////
	
	//1. 게시글 목록 조회
	@Override
	public List<CommunityVO> selectCommuList(CommunityVO communityVO) {
		return sqlSession.selectList("communityMapper.selectCommuList", communityVO);
	}
	
	//1-1. 게시글 목록 조회 페이징
	@Override
	public int selectCommuCnt(CommunityVO communityVO) {
		return sqlSession.selectOne("communityMapper.selectCommuCnt", communityVO);
	}
	
	//1-2. 조회수 증가
	@Override
	public void updaterReadCnt(String commuCode) {
		sqlSession.selectOne("communityMapper.updaterReadCnt", commuCode);
		
	}
	
	//2. 게시글 등록하기
	@Override
	public void insertCommu(CommunityVO communityVO) {
		sqlSession.insert("communityMapper.insertCommu", communityVO);
	}
	
	//3. 게시글 상세보기
	@Override
	public CommunityVO selectCommuDetail(CommunityVO communityVO) {
		return sqlSession.selectOne("communityMapper.selectCommuDetail", communityVO);
	}
	
	//3-1. 게시글 상세 수정
	@Override
	public void updateCommu(CommunityVO communityVO) {
		sqlSession.update("communityMapper.updateCommu", communityVO);
		
	}
	
	//3-2. 게시글 상세 삭제
	@Override
	public void deleteCommu(String commuCode) {
		sqlSession.delete("communityMapper.deleteCommu", commuCode);
	}

	
	


	


	



	

	
   
	
	
}
