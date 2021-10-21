package com.kh.project.member.service;

import java.util.List;

import com.kh.project.member.vo.MemberVO;

public interface MemberService {
	
	//1.회원가입하기
	void join(MemberVO memberVO);
	
	//1) 아이디 체크
	boolean overlapId(String id);
	
	//2) 닉네임 체크
	boolean overlapNick(String nickName);
	
	//2. 로그인
	MemberVO login(MemberVO memberVO);
	
	//3. (admin)회원목록조회
	List<MemberVO> selectMemberList(MemberVO memberVO);
	
	//4. (admin)회원상세조회
	MemberVO selectMemberDetail(MemberVO memberVO);
 	
}
