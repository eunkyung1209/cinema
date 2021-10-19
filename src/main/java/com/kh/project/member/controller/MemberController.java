package com.kh.project.member.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	//회원 관련 기능 구현
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
}
