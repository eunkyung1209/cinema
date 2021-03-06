package com.kh.project.customerCenter.service;

import java.util.List;

import com.kh.project.customerCenter.vo.CustomerCenterReplyVO;
import com.kh.project.customerCenter.vo.CustomerCenterVO;

public interface CustomerCenterService {
	
	//고객센터 전체 문의글 조회
	List<CustomerCenterVO> selectCustomerBoard(CustomerCenterVO customerCenterVO);
	
	//고객센터 문의글 등록
	void insertCustomerBoard(CustomerCenterVO customerCenterVO);
	
	//고객센터 글 상세보기
	CustomerCenterVO selectCustomerBoardDetail(String customerCode);
	
	//관리자 조회 여부 업데이트
	void updateIsRead(String customerCode);
	
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
	
	//페이징 처리(전체 데이터 수)
	int selectCustomerCnt(CustomerCenterVO customerCenterVO);
	
	//게시글 수정	
	void updateCustomer(CustomerCenterVO customerCenterVO);
	
	//댓글 목록 조회
	List<CustomerCenterReplyVO> selectCustomerReply(String customerCode);
	
	//댓글 등록해주기
	void insertCustomerReply(CustomerCenterReplyVO customerCenterReplyVO);
	
	//분실물 리스트 조회
	List<CustomerCenterVO> selectCustomerLost(CustomerCenterVO customerCenterVO);
	
	//게시글 삭제
	void deleteCustomer(String customerCode);
	
	//댓글 삭제
	void deleteCustomerReply(String customeReplyCode);
	
	//댓글 수정
	void updateCustomerReply(CustomerCenterReplyVO customerCenterReplyVO);
	
	
	
	
}
