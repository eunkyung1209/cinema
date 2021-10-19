package com.kh.project.customerCenter.service;

import java.util.List;

import com.kh.project.customerCenter.vo.CustomerCenterVO;

public interface CustomerCenterService {
	
	//고객센터 전체 문의글 조회
	List<CustomerCenterVO> selectCustomerBoard();
}
