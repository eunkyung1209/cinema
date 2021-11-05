package com.kh.project.member.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.project.community.service.CommunityService;
import com.kh.project.community.vo.CommunityVO;
import com.kh.project.customerCenter.service.CustomerCenterService;
import com.kh.project.customerCenter.vo.CustomerCenterVO;
import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	//회원 관련 기능 구현
	
	@Resource(name = "customerCenterService")
	private CustomerCenterService customerCenterService;
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
	
	//1. 회원가입 페이지 가기
	@GetMapping("/join")
	public String goJoin() {
		return "member/join";
	}
	
	/*
	 * //1)id 중복 체크
	 * 
	 * @ResponseBody
	 * 
	 * @PostMapping("/checkId") public boolean checkId(String id) { return
	 * memberService.overlapId(id); }
	 * 
	 * //2)닉네임 중복 체크
	 * 
	 * @ResponseBody
	 * 
	 * @PostMapping("/checkNick") public boolean checkNick(String nickName) { return
	 * memberService.overlapNick(nickName); }
	 * 
	 * //1-1. 회원가입하기
	 * 
	 * @PostMapping("/join") public String join(MemberVO memberVO) {
	 * memberService.join(memberVO);
	 * 
	 * return "redirect:/movie/mainPage"; }
	 */
	
	
	// 유효성 검사중
	
	
	
	
	/*
	 * // 멤버에이작스 작업중
	 * 
	 * @ResponseBody
	 * 
	 * @PostMapping("/memberAjax") public String memberAjax(MemberVO memberVO) {
	 * memberService.join(memberVO);
	 * 
	 * return "redirect:/movie/mainPage"; }
	 */
	
	/*
	 * //1)id 중복 체크
	 * 
	 * @RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public int idCheck(@RequestParam("id") String id) {
	 * 
	 * return memberService.checkOverId(id); }
	 */
	
	
	// 은빈이 유효성 검사중
	
	//1)id 중복 체크
	@RequestMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		
		return memberService.checkOverId(id); 
	}
	
	//2)email 중복 체크
	@RequestMapping("/emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam("email") String email) {
		
		return memberService.checkOverEmail(email);
	}
	
	//3)nickName 중복 체크
	@RequestMapping("/nickNameCheck")
	@ResponseBody
	public int nickNameCheck(@RequestParam("nickName") String nickName) {
		
		return memberService.checkOverNickName(nickName);
	}
	
	//1-1. 회원가입하기
	@PostMapping("/join")
	public String join(MemberVO memberVO) {
		memberService.join(memberVO);
		
		return "redirect:/movie/mainPage"; 
	}
	
	//로그인
	@ResponseBody
	@RequestMapping("/loginCheck")
	public int loginCheck(MemberVO memberVO, HttpSession session,  HttpServletRequest request, String id) {
		
		
		MemberVO loginInfo = memberService.checkLogin(memberVO);
		
		//로그인 성공
		if(loginInfo != null) {
			
			session.setAttribute("loginInfo", loginInfo);
	    	
			System.out.println("welcome = " + loginInfo.getId());
			
			return 1;
			
		}
		
		//로그인 실패
		return 0;
	}

	//2-1. 로그인
	/*
	 * @RequestMapping("/login") public String login(MemberVO memberVO, HttpSession
	 * session) { MemberVO loginInfo = memberService.login(memberVO);
	 * 
	 * //로그인 성공 if(loginInfo != null) { session.setAttribute("loginInfo",
	 * loginInfo);
	 * 
	 * //관리자이면 if(loginInfo.getIsAdmin().equals("Y")) { return
	 * "redirect:/movie/mainPage"; } //일반회원이면 else {
	 * //loginInfo.getIsAdmin().equals("N")인 경우 return "redirect:/movie/mainPage"; }
	 * }
	 * 
	 * //로그인 실패 return "redirect:/member/loginCheck"; }
	 */
	
	//------------로그인 인터셉터 *로그인 안했으면 하라고 하기*------------
	// 고객센터 글 비번 입력
	/*
	 * @GetMapping("/inputLogin") private String inputLogin(MemberVO memberVO,
	 * HttpSession session) {
	 * 
	 * MemberVO loginInfo = memberService.login(memberVO);
	 * 
	 * //로그인 성공 if(loginInfo != null) { session.setAttribute("loginInfo",
	 * loginInfo);
	 * 
	 * //관리자이면 if(loginInfo.getIsAdmin().equals("Y")) { return
	 * "redirect:/member/myPage"; } //일반회원이면 else {
	 * //loginInfo.getIsAdmin().equals("N")인 경우 return "redirect:/member/myPage"; }
	 * }
	 * 
	 * return "member/input_login"; }
	 */
	
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginInfo");
		
		return "redirect:/movie/mainPage";
	}

	
	//3. 마이페이지 *로그인후만 접근 가능*
	@GetMapping("/myPage")
	public String myPage(Model model, MemberVO memberVO) {
		
		//나의 상담내역 목록 보내기
		model.addAttribute("customerBoardList", memberService.selectMyCustomerByMypage(memberVO));
		
		//나의 상담내역 목록 보내기
		model.addAttribute("commuList", memberService.selectMyCommurByMypage(memberVO));
		
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
	public String deleteMember(String id, HttpSession session) {
		session.removeAttribute("loginInfo");
		memberService.deleteMember(id);
		
		return "redirect:/movie/mainPage";
	}
	
	//3-4 마이페이지에서 내가 쓴글 확인하기
	@RequestMapping("/myBoardList")
	public String myBoardList(CommunityVO communityVO, Model model, MemberVO memberVO) {
		
		//-----페이징 처리------//
		//전체 데이터 수
		int dataCnt = memberService.selectCommuCnt(communityVO);
		memberVO.setTotalCnt(dataCnt);
		//페이징처리
		memberVO.setPageInfo();
		
		model.addAttribute("boardList", memberService.myBoardList(memberVO));
		
		System.out.println("!!!!" + memberVO.getNickName());
		
		return "member/my_community_board_list";
	}
	
	
	//3-4 마이페이지에서 내가 쓴 큐엔에이 확인하기
	//내 상담내역 페이지로 이동
	/*
	 * @GetMapping("/goMyCustomer") private String goMyCustomer(Model model,
	 * CustomerCenterVO customerCenterVO) {
	 * 
	 * //-----페이징 처리------// //전체 데이터 수 int dataCnt =
	 * customerCenterService.selectCustomerCnt(customerCenterVO);
	 * customerCenterVO.setTotalCnt(dataCnt); //페이징처리
	 * customerCenterVO.setPageInfo();
	 * 
	 * //나의 상담내역 목록 보내기 model.addAttribute("customerBoardList",
	 * customerCenterService.selectMyCustomer(customerCenterVO));
	 * 
	 * return "redirect:member/myPage"; }
	 */
}
