package com.kh.project.member.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	//회원 관련 기능 구현
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
	//1. 회원가입 페이지 가기
	@GetMapping("/insertJoinMember")
	public String goinsertJoinMember() {
		
		return "member/join_page";
	}
	
	//1-1. 회원가입하기
	@PostMapping("/insertJoinMember")
	public String insertJoinMember(MemberVO memberVO) {
		memberService.insertJoinMember(memberVO);
		return "template/menu";
	}

	
	
}
