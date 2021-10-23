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
	
	//다음 customerCode 조회
	String selectNextCustomerCode();
	
	//다음 customerImgCode 조회
	int selectNextCustomerImgCode();
	
	//이미지 삽입하기
	void insertCustomerImg(CustomerCenterVO customerCenterVO);
	
	//공지사항 목록 조회
	List<CustomerCenterVO> selectNoticeBoard(CustomerCenterVO customerCenterVO);
	
	//나의 문의내역 조회
	List<CustomerCenterVO> selectMyCustomer(CustomerCenterVO customerCenterVO);
	
	//페이징 처리
	int selectCustomerCnt(CustomerCenterVO customerCenterVO);
	
	
}
