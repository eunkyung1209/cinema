package com.kh.project.community.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService")
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
