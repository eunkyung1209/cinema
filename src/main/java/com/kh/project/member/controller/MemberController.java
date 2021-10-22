package com.kh.project.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	//회원 관련 기능 구현
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
	//1. 회원가입 페이지 가기
	@GetMapping("/join")
	public String goJoin() {
		return "member/join";
	}
	
	//1)id 중복 체크
	@ResponseBody
	@PostMapping("/checkId")
	public boolean checkId(String id) {
		return memberService.overlapId(id);
	}
	
	//2)닉네임 중복 체크
	@ResponseBody
	@PostMapping("/checkNick")
	public boolean checkNick(String nickName) {
		return memberService.overlapNick(nickName);
	}	
	
	//1-1. 회원가입하기
	@PostMapping("/join")
	public String join(MemberVO memberVO) {
		memberService.join(memberVO);
		
		return "redirect:/movie/mainPage";
	}
	
	//2. 로그인
	@PostMapping("/login")
	public String login(MemberVO memberVO, HttpSession session) {
		MemberVO loginInfo = memberService.login(memberVO);
		
		//로그인 성공
		if(loginInfo != null) {
			session.setAttribute("loginInfo", loginInfo);
			
			//관리자이면
			if(loginInfo.getIsAdmin().equals("Y")) {
				return "redirect:/movie/mainPage";
			}
			//일반회원이면
			else {	//loginInfo.getIsAdmin().equals("N")인 경우
				return "redirect:/movie/mainPage";
			}
		}
		
		//로그인 실패
		return "redirect:/movie/mainPage";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginInfo");
		
		return "redirect:/movie/mainPage";
	}
	
	//3. 마이페이지 *로그인후만 접근 가능*
	@GetMapping("/myPage")
	public String myPage() {
		return "member/myPage";
	}
	
	//3-1. 마이페이지에서 내정보 수정페이지로 넘어가기
	@GetMapping("/updateMyPage")
	public String goUpdateMyPage() {
		return "member/update_myPage";
	}
	
	//3-2. 마이페이지에서 내정보 수정하기
	@PostMapping("/updateMyPage")
	public String updateMyPage(MemberVO memberVO) {
		memberService.updateMyPage(memberVO);
		
		return "redirect:/movie/mainPage";
	}
	
	//3-3. 마이페이지에서 회원 탈퇴하기
	@GetMapping("/deleteMember")
	public String deleteMember(String id) {
		memberService.deleteMember(id);
		
		return "redirect:/movie/mainPage";
	}
	
	
}
