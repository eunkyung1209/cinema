package com.kh.project.community.controller;



import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.kh.project.community.service.CommunityService;
import com.kh.project.community.vo.CommunityVO;
import com.kh.project.customerCenter.vo.CustomerCenterVO;

@Controller
@RequestMapping("/community")
public class CommunityController {
	//커뮤니티 기능 구현
	
	@Resource(name = "communityService")
	private CommunityService communityService;
	
	
	// 1. 커뮤니티 게시글 목록화면
	@GetMapping("/commuList")
	public String commuList(Model model, CommunityVO communityVO) {
		
		//페이징 처리
		communityVO.setTotalCnt(communityService.selectCommuCnt(communityVO));
		communityVO.setPageInfo();
				
		//카테고리 목록 조회 후 jsp로 전달
		model.addAttribute("commuList", communityService.selectCommuList(communityVO));
		
		return "community/community_board_list";
	}
	
	// 2. 커뮤니티 게시글 작성으로 이동 (로그인할때만 가능)
	@GetMapping("/commuWrite")
	private String goCommuWrite() {
		return "community/community_writer_form";
	}
	
	// 2-1. 커뮤니티 게시글 작성(로그인할때만 가능)
	@PostMapping("/commuWrite")
	private String CommuWrite(CommunityVO communityVO) {
		
		communityService.insertCommu(communityVO);
		
		return "redirect:/community/commuList";
	}
	
	// 3. 커뮤니티 상세보기
	// 고객센터 글 비번 입력
	@GetMapping("/selectCommuPw")
	private String selectCommuPw(CommunityVO communityVO) {
		return "community/input_password";
	}

	// 3. 커뮤니티 상세보기
	@GetMapping("/selectCommuDetail")
	private String selectCommuDetail(Model model, String commuCode) {
		
		//상세보기 정보
		model.addAttribute("customerBoard", communityService.selectCommuDetail(commuCode));
		//댓글 목록 불러오기
		//model.addAttribute("customerReplyList", communityService.selectCustomerReply(customerCode));
		
		return "customer/customer_board_detail";
	}
	
	
	
	
	
	
//	//게시글 ㄱㄱ
//	// 로그인시 작성 버튼!눌렀을때, 게시판 글 작성할수있는 페이지로 이동
//	@GetMapping("/boardWriterForm")
//	public String insertBoardGo() {
//		return "community/community_writerForm";
//	}
//	
//	//게시글 작성화면
//	// 게시글 등록
//	@PostMapping("/insertBoard")
//	public String insertBoard(CommunityVO communityVO) {
//		boardService.insertBoard(communityVO);
//		
//		return "redirect:/board/boardList";
//	}
//	//글 상세정보 ->게시글등록된걸 누르면 게시글 작성된화면 보여주기
//	@GetMapping("/boardDetail")
//	public String selectboardDetail(Model model,CommunityVO communityVO,CommunityReplyVO communityReplyVO ) {
//		//게시글 목록조회
//		model.addAttribute("communityVO",boardService.selectBoardDetail(communityVO));
//		// 댓글 목록조회--> 안됨
//		model.addAttribute("communityReplyVO",boardService.selectReply(communityReplyVO));
//		
//		
//		
//		return "community/community_detail";
//	}
//	
//	//게시글 상세보기화면; 댓글 등록.
//		@PostMapping("/insertReply")
//		public String insertReply(CommunityReplyVO communityReplyVO, Model model) {
//			//댓글등록
//			boardService.insertReply(communityReplyVO);
//			
//			//커뮤코드 가져감
//			model.addAttribute("cummuCode", communityReplyVO.getCommuCode());
//		
//			
//			return "redirect:/board/boardDetail";
//		}
//	
//	// 게시글 삭제-> 작성자만 삭제 버튼 보이게하고싶
//	@GetMapping("/deleteBoard")
//	public String deleteBoard(CommunityVO communityVO ) {
//		
//		boardService.deleteBoard(communityVO);
//		
//		return "redirect:/board/boardList";
//	}
//	
//	// 게시글 수정폼으로!!
//	@GetMapping("/goUpdateBoard")
//	public String goUpdateBoard(CommunityVO communityVO, Model model) {
//		
//		
//		model.addAttribute("communityVO",boardService.selectBoardDetail(communityVO));
//		
//		return "community/communityUpdateBoard";
//	}
//	
//	// 게시글 수정 -> 작성자만 수정 버튼 보이게하고싶음
//	@GetMapping("/updateBoard")
//	public String updateBoard(CommunityVO communityVO, Model model) {
//		
//		boardService.updateBoard(communityVO);
//		
//		model.addAttribute("communityVO",boardService.selectBoardDetail(communityVO));
//		
//		return "redirect:/board/boardWriterForm";
//	}
//	
//	//댓글 삭제
	
	
}
