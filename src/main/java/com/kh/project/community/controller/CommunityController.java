package com.kh.project.community.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.kh.project.community.service.CommunityService;
import com.kh.project.community.vo.CommunityReplyVO;
import com.kh.project.community.vo.CommunityVO;

@Controller
@RequestMapping("/board")
public class CommunityController {
	//커뮤니티 기능 구현
	
	@Resource(name = "boardService")
	private CommunityService boardService;
	
	// 게시글 목록화면
	@GetMapping("/boardList")
	public String boardList(Model model) {
		model.addAttribute("boardList", boardService.selectBoardList());
		
		return "community/community_board_list";
		
	}
	//게시글 ㄱㄱ
	// 로그인시 작성 버튼!눌렀을때, 게시판 글 작성할수있는 페이지로 이동
	@GetMapping("/boardWriterForm")
	public String insertBoardGo() {
		return "community/community_writerForm";
	}
	
	//게시글 작성화면
	// 게시글 등록
	@PostMapping("/insertBoard")
	public String insertBoard(CommunityVO communityVO) {
		boardService.insertBoard(communityVO);
		// 비밀번호 등록
		// 파일첨부
		return "redirect:/board/boardList";
	}
	//글 상세정보 ->게시글등록된걸 누르면 게시글 작성된화면 보여주기
	@GetMapping("/boardDetail")
	public String selectboardDetail(Model model,CommunityVO communityVO) {
		model.addAttribute("boardDetail", boardService.selectboardDetail(communityVO));
		model.addAttribute("communityReplyList", boardService.selectboardReply(communityVO));
		
		return "community/community_detail";
	}
	
	// 게시글 삭제-> 작성자만 삭제 버튼 보이게하고싶음
	@GetMapping("/deleteBoard")
	public String deleteBoard(CommunityVO communityVO ) {
		boardService.deleteBoard(communityVO);
		
		return "redirect:/board/boardList";
	}
	
	// 게시글 수정 -> 작성자만 수정 버튼 보이게하고싶음
	@GetMapping("/updateBoard")
	public String updateBoard(CommunityVO communityVO) {
		boardService.updateBoard(communityVO);

		return "redirect:/board/boardDetail";
	}
	
	
	

	
}
