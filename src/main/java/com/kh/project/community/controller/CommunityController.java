package com.kh.project.community.controller;



import javax.annotation.Resource;

import org.apache.tiles.request.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.kh.project.community.service.CommunityService;
import com.kh.project.community.vo.CommunityReplyVO;
import com.kh.project.community.vo.CommunityVO;
import com.kh.project.customerCenter.vo.CustomerCenterReplyVO;
import com.kh.project.customerCenter.vo.CustomerCenterVO;
import com.kh.project.member.vo.MemberVO;

@Controller
@RequestMapping("/community")
public class CommunityController {
	//커뮤니티 기능 구현
	
	@Resource(name = "communityService")
	private CommunityService communityService;
	
	
	// 1. 커뮤니티 게시글 목록화면
	@RequestMapping("/commuList")
	public String commuList(Model model, CommunityVO communityVO) {
		
		//-----페이징 처리------//
		//전체 데이터 수
		int dataCnt = communityService.selectCommuCnt(communityVO);
		communityVO.setTotalCnt(dataCnt);
		//페이징처리
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
	private String selectCommuDetail(Model model, CommunityVO communityVO, String commuCode) {
		
		CommunityVO result = communityService.selectCommuDetail(communityVO);
		result.setContent(result.getContent().replaceAll("\r\n", "<br>"));
		
		//상세보기 정보
		model.addAttribute("commuList", result);
		
		//댓글 목록 불러오기
		model.addAttribute("commuReplyList", communityService.selectCommuReply(commuCode));
		
		//조회수 증가
		communityService.updaterReadCnt(commuCode);
		
		return "community/community_detail";
	}
	
	// 3-1. 커뮤니티 상세 수정 페이지 가기
	@GetMapping("/goUpdateCommu")
	public String goUpdateCommu(Model model, CommunityVO communityVO) {
		
		//원래정보 빼오기
		model.addAttribute("commuList", communityService.selectCommuDetail(communityVO));
		return "community/community_update_board";
	}
	
	// 3-2. 커뮤니티 상세 수정
	@PostMapping("/updateCommu")
	public String updateCommu(CommunityVO communityVO) {
		
		communityService.updateCommu(communityVO);
		
		return "redirect:/community/commuList";
	}
	
	// 3-3. 커뮤니티 상세 삭제
	@GetMapping("/deleteCommu")
	private String deleteCommu(Model model, String commuCode) {
		
		communityService.deleteCommu(commuCode);
		
		return "redirect:/community/commuList";
	}
	
	//4. 댓글 등록하기
	@PostMapping("/insertCommuReply")
	private String insertCommuReply(Model model, CommunityReplyVO communityReplyVO) {
		
		communityService.insertCommuReply(communityReplyVO);
		
		//등록 후 다시 페이지로 돌아가기
		model.addAttribute("commuCode", communityReplyVO.getCommuCode());
		
		return "redirect:/community/selectCommuDetail";
	}
	
	//4-1. 댓글 삭제하기
	@PostMapping("updateCummuReply")
	private String updateCummuReply(Model model, CommunityReplyVO communityReplyVO) {
		
		communityService.updateCummuReply(communityReplyVO);
		
		//상세보기 페이지 코드 넘겨주기
		model.addAttribute("commuCode", communityReplyVO.getCommuCode());
		
		return "redirect:/community/selectCommuDetail";
	}
	
	//4-2. 댓글 삭제하기
	@GetMapping("/deleteCummuReply")
	private String deleteCummuReply(String commuReplyCode, String commuCode, Model model) {
		
		communityService.deleteCummuReply(commuReplyCode);
		
		//상세보기 페이지 코드 넘겨주기
		model.addAttribute("commuCode", commuCode);
		
		return "redirect:/community/selectCommuDetail";
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
