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

	//고객센터 문의글  등록
	@Override
	public void insertCustomerBoard(CustomerCenterVO customerCenterVO) {
		sqlSession.insert("customerCenterMapper.insertCustomerBoard", customerCenterVO);
	}

	//고객센터 글 상세보기
	@Override
	public CustomerCenterVO selectCustomerBoardDetail(CustomerCenterVO customerCenterVO) {
		return sqlSession.selectOne("customerCenterMapper.selectCustomerBoardDetail", customerCenterVO);
	}
	
	
	
}
