package com.kh.project.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//1. 회원가입 하기
	@Override
	public void insertJoinMember(MemberVO memberVO) {
		sqlSession.insert("memberMapper.insertJoinMember", memberVO);
		
	}
	
	
	
}
