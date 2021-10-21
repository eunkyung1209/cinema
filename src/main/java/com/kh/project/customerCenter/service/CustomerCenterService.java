package com.kh.project.customerCenter.service;

import java.util.List;

import com.kh.project.customerCenter.vo.CustomerCenterVO;

public interface CustomerCenterService {
	
	//고객센터 전체 문의글 조회
	List<CustomerCenterVO> selectCustomerBoard(CustomerCenterVO customerCenterVO);
	
	//고객센터 문의글 등록
	void insertCustomerBoard(CustomerCenterVO customerCenterVO);
	
	//고객센터 글 상세보기
	CustomerCenterVO selectCustomerBoardDetail(String customerCode);
	
}
