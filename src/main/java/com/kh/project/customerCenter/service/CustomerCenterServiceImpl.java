package com.kh.project.customerCenter.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.customerCenter.vo.CustomerCenterVO;

@Service("customerCenterService")
public class CustomerCenterServiceImpl implements CustomerCenterService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//고객센터 전체 문의글 조회
	@Override
	public List<CustomerCenterVO> selectCustomerBoard() {
		return sqlSession.selectList("customerCenterMapper.selectCustomerBoard");
	}
	
	
	
}
