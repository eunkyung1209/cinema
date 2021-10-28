package com.kh.project.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.community.vo.CommunityVO;
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
	
	/*
	 * //1-1) 아이디 체크
	 * 
	 * @Override public boolean overlapId(String id) { String result =
	 * sqlSession.selectOne("memberMapper.overlapId", id); //result != null : 가입 Y
	 * -> return true; //result == null : 가입 N -> return false; return result ==
	 * null ? false : true; }
	 * 
	 * //1-2) 닉네임 체크
	 * 
	 * @Override public boolean overlapNick(String nickName) { String result =
	 * sqlSession.selectOne("memberMapper.overlapNick", nickName); //result != null
	 * : 가입 Y -> return true; //result == null : 가입 N -> return false; return result
	 * == null ? false : true; }
	 */
	
	
	
	
	
	//은빈이 유효성 검사중
	
	//아이디 중복체크
	@Override
	public int checkOverId(String id) {
		return sqlSession.selectOne("memberMapper.checkOverId", id);
		
	}
	//아이디 중복체크
	@Override
	public int checkOverEmail(String email) {
		return sqlSession.selectOne("memberMapper.checkOverEmail", email);
	}
	//아이디 중복체크
	@Override
	public int checkOverNickName(String nickName) {
		return sqlSession.selectOne("memberMapper.checkOverNickName", nickName);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//2. 로그인
	@Override
	public MemberVO login(MemberVO memberVO) {
		return sqlSession.selectOne("memberMapper.login", memberVO);
	}
	
	//3. (admin)회원 목록 조회
	@Override
	public List<MemberVO> selectMemberList(MemberVO memberVO) {
		return sqlSession.selectList("memberMapper.selectMemberList", memberVO);
	}
	
	//3-1) 회원목록 전체 데이터 개수 조회
	@Override
	public int selectMemberCnt(MemberVO memberVO) {
		return sqlSession.selectOne("memberMapper.selectMemberCnt", memberVO);
	}	
	
	
	//4. (admin)회원 상세 조회
	@Override
	public MemberVO selectMemberDetail(MemberVO memberVO) {
		return sqlSession.selectOne("memberMapper.selectMemberDetail", memberVO);
	}
	
	//5. (로그인후) 마이페이지 나의 정보 수정하기
	@Override
	public int updateMyPage(MemberVO memberVO) {
		return sqlSession.update("memberMapper.updateMyPage", memberVO);
	}

	
	//6. (로그인후) 마이페이지 회원탈퇴하기
	@Override
	public void deleteMember(String id) {
		sqlSession.delete("memberMapper.deleteMember", id);
		
	}
	
	//7. (로그인후) 마이페이지에서 내가 쓴글 확인하기
	@Override
	public List<CommunityVO> myBoardList(MemberVO memberVO) {
		return sqlSession.selectList("memberMapper.myBoardList", memberVO);
	}
	
	//7-1. 커뮤 페이징 처리
	@Override
	public int selectCommuCnt(CommunityVO communityVO) {
		return sqlSession.selectOne("memberMapper.selectCommuCnt", communityVO);
	}







	
}
