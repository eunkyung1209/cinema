package com.kh.project.customerCenter.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("customerCenterService")
public class CustomerCenterServiceImpl implements CustomerCenterService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
