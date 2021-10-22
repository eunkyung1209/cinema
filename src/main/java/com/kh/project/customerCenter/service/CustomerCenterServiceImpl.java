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
	
	
	
	
	
}
