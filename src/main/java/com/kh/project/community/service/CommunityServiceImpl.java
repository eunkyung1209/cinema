package com.kh.project.community.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.community.vo.CommunityReplyVO;
import com.kh.project.community.vo.CommunityVO;

@Service("boardService")
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CommunityVO> selectBoardList() {
		return sqlSession.selectList("communityMapper.selectBoardList");
	}

	@Override
	public void insertBoard(CommunityVO communityVO) {
		sqlSession.insert("communityMapper.insertBoard",communityVO);
	}

	@Override
	public void deleteBoard(String commuCode) {
		sqlSession.delete("communityMapper.deleteBoard");
		
	}

	

	
   
	
	
}
