package com.kh.project.member.service;

import java.util.List;

import com.kh.project.member.vo.MemberVO;

public interface MemberService {
	
	//1.회원가입하기
	void join(MemberVO memberVO);
	
	//1-1) 아이디 체크
	boolean overlapId(String id);
	
	//1-2) 닉네임 체크
	boolean overlapNick(String nickName);
	
	//2. 로그인
	MemberVO login(MemberVO memberVO);
	
	//3. (admin)회원목록조회
	List<MemberVO> selectMemberList(MemberVO memberVO);
	
	//3-1) 회원목록 전체 데이터 개수 조회
	int selectMemberCnt(MemberVO memberVO);
	
	//4. (admin)회원상세조회
	MemberVO selectMemberDetail(MemberVO memberVO);
 	
	//5. (로그인후) 마이페이지 나의 정보 수정하기
	int updateMyPage(MemberVO memberVO);
	
	//6. (로그인후) 마이페이지 회원탈퇴하기
	void deleteMember(String id);
	
}
