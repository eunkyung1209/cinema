package com.kh.project.common.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("commonService")
public class CommonServiceImpl implements CommonService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
