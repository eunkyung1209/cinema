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
	public void join(MemberVO memberVO) {
		sqlSession.insert("memberMapper.join", memberVO);
	}
	
	//1) 아이디 체크
	@Override
	public boolean overlapId(String id) {
		String result = sqlSession.selectOne("memberMapper.overlapId", id);
		//result != null : 가입 Y -> return true;
		//result == null : 가입 N -> return false;
		return result == null ? false : true;
	}
	
	//2) 닉네임 체크
	@Override
	public boolean overlapNick(String nickName) {
		String result = sqlSession.selectOne("memberMapper.overlapNick", nickName);
		//result != null : 가입 Y -> return true;
		//result == null : 가입 N -> return false;
		return result == null ? false : true;
	}
	
	//로그인
	@Override
	public MemberVO login(MemberVO memberVO) {
		return sqlSession.selectOne("memberMapper.login", memberVO);
	}

	
}
