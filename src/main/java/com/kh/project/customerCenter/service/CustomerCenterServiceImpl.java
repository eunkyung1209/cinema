package com.kh.project.customerCenter.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.customerCenter.vo.CustomerCenterReplyVO;
import com.kh.project.customerCenter.vo.CustomerCenterVO;

@Service("customerCenterService")
public class CustomerCenterServiceImpl implements CustomerCenterService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//고객센터 전체 문의글 조회
	@Override
	public List<CustomerCenterVO> selectCustomerBoard(CustomerCenterVO customerCenterVO) {
		return sqlSession.selectList("customerCenterMapper.selectCustomerBoard", customerCenterVO );
	}

	//고객센터 문의글  등록
	@Override
	public void insertCustomerBoard(CustomerCenterVO customerCenterVO) {
		sqlSession.insert("customerCenterMapper.insertCustomerBoard", customerCenterVO);
	}

	//고객센터 글 상세보기
	@Override
	public CustomerCenterVO selectCustomerBoardDetail(String customerCode) {
		return sqlSession.selectOne("customerCenterMapper.selectCustomerBoardDetail", customerCode);
	}
	
	//관리자 조회 여부 업데이트
	@Override
	public void updateIsRead(String customerCode) {
		sqlSession.update("customerCenterMapper.updateIsRead", customerCode);
	}

	//다음 customerCode 조회
	@Override
	public String selectNextCustomerCode() {
		return sqlSession.selectOne("customerCenterMapper.selectNextCustomerCode");
	}

	//다음 customerImgCode 조회
	@Override
	public int selectNextCustomerImgCode() {
		return sqlSession.selectOne("customerCenterMapper.selectNextCustomerImgCode");
	}

	//이미지 삽입
	@Override
	public void insertCustomerImg(CustomerCenterVO customerCenterVO) {
		sqlSession.insert("customerCenterMapper.insertCustomerImg", customerCenterVO);
	}

	//공지목록 조회
	@Override
	public List<CustomerCenterVO> selectNoticeBoard(CustomerCenterVO customerCenterVO) {
		return sqlSession.selectList("customerCenterMapper.selectNoticeBoard", customerCenterVO);
	}
	
	//나의 문의내역 조회
	@Override
	public List<CustomerCenterVO> selectMyCustomer(CustomerCenterVO customerCenterVO) {
		return sqlSession.selectList("customerCenterMapper.selectMyCustomer", customerCenterVO);
	}

	//페이징처리
	@Override
	public int selectCustomerCnt(CustomerCenterVO customerCenterVO) {
		return sqlSession.selectOne("customerCenterMapper.selectCustomerCnt", customerCenterVO);
	}

	//게시글 수정
	@Override
	public void updateCustomer(CustomerCenterVO customerCenterVO) {
		sqlSession.update("customerCenterMapper.updateCustomer", customerCenterVO);
	}

	//댓글 목록 조회
	@Override
	public List<CustomerCenterReplyVO> selectCustomerReply(String customerCode) {
		return sqlSession.selectList("customerCenterMapper.selectCustomerReply", customerCode);
	}

	//댓글 등록
	@Override
	public void insertCustomerReply(CustomerCenterReplyVO customerCenterReplyVO) {
		sqlSession.insert("customerCenterMapper.insertCustomerReply", customerCenterReplyVO);
	}

	//분실물 리스트 조회
	@Override
	public List<CustomerCenterVO> selectCustomerLost(CustomerCenterVO customerCenterVO) {
		return sqlSession.selectList("customerCenterMapper.selectCustomerLost", customerCenterVO);
	}

	//게시글 삭제
	@Override
	public void deleteCustomer(String customerCode) {
		sqlSession.delete("customerCenterMapper.deleteCustomer", customerCode);
		
	}

	//댓글 삭제
	@Override
	public void deleteCustomerReply(String customeReplyCode) {
		sqlSession.delete("customerCenterMapper.deleteCustomerReply", customeReplyCode);
	}

	//댓글 수정
	@Override
	public void updateCustomerReply(CustomerCenterReplyVO customerCenterReplyVO) {
		sqlSession.update("customerCenterMapper.updateCustomerReply", customerCenterReplyVO);
	}

	
	
	
	
	
	
}
