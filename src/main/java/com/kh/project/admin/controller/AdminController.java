package com.kh.project.admin.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.project.community.service.CommunityService;
import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.MemberVO;
import com.kh.project.movie.service.MovieService;
import com.kh.project.movie.vo.MovieImgVO;
import com.kh.project.movie.vo.MovieVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	//관리자 기능 구현
	
	@Resource(name = "boardService")
	private CommunityService boardService;
	
	@Resource(name = "movieService")
	private MovieService movieService;
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
	//영화 관리 페이지로 이동
	@GetMapping("/movieManage")
	public String movieManage(Model model) {
		model.addAttribute("movieList", movieService.selectAdminMovieList());
		
		return "admin/movie_manage";
	}
	
	//영화 삭제
	@GetMapping("/deleteMovie")
	public String deleteMovie(String mvCode) {
		movieService.deleteMovie(mvCode);
		
		return "redirect:/admin/movieManage";
	}
	
	//영화 등록 페이지로 이동
	@GetMapping("/goInsertMovie")
	public String goInsertMovie(Model model) {
		return "admin/insert_movie";
	}
	
	//영화 등록
	@PostMapping("/insertMovie")
	public String insertMovie(Model model, MultipartHttpServletRequest multi, MultipartFile file, MovieVO movieVO) {
		//----------코드 생성----------
		//영화 코드
		String mvCode = movieService.selectNextMovieCode();
		//영화 포스터 이미지 코드
		String movieImgCode = movieService.selectNextImgCode();
		
		//----------이미지 파일 단일 첨부----------
		//영화 포스터 이미지 객체 생성
		MovieImgVO movieImgVO = new MovieImgVO();
		//첨부될 폴더
		String uploadPath = "D:\\workspaceSTS\\Cinema\\src\\main\\webapp\\resources\\images\\movie\\";	//은경 - 학원 컴퓨터 경로
		//String uploadPath = "C:\\Users\\Administrator\\git\\cinema\\src\\main\\webapp\\resources\\images\\movie\\";	//은경 - 노트북 경로
		//input 태그에 접근해서 파일을 가져옴
		file = multi.getFile("imageFile");	//파일첨부 input 태그 name 속성 값 = imageFile
		//변환한 파일명 (영화제목을 파일명으로 쓰고, 그걸 그대로 저장)
		String attachedFileName = file.getOriginalFilename();
		//파일 저장한 경로 + 변환한 파일명
		String uploadFile = uploadPath + attachedFileName;
		//파일 첨부
		try {
			//transfer : 이동, 이전, 옮김
			file.transferTo(new File(uploadFile));
			
			//영화 포스터 이미지 정보 설정
			movieImgVO.setMovieImgCode(movieImgCode);
			movieImgVO.setOriginImgName(file.getOriginalFilename());
			movieImgVO.setAttachedImgName(attachedFileName);
			movieImgVO.setMvCode(mvCode);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//----------상품&이미지 정보 등록----------
		//MV_CODE 설정
		movieVO.setMvCode(mvCode);
		//MOVIE_IMG_CODE 설정
		movieImgVO.setMovieImgCode(movieImgCode);
		//영화 정보 등록
		movieService.insertMovie(movieVO);
		//영화 포스터 이미지 등록
		movieService.insertImage(movieImgVO);
		
		return "redirect:/admin/movieManage";
	}
	
	//1.회원 목록 조회
	@RequestMapping("/adminMemberList")
	public String adminMemberList(Model model, MemberVO memberVO) {
		//페이징 처리
		memberVO.setTotalCnt(memberService.selectMemberCnt(memberVO));
		memberVO.setPageInfo();
		
		//카테고리 목록 조회 후 jsp로 전달
		model.addAttribute("memberList", memberService.selectMemberList(memberVO));
		
		return "admin/admin_member_list";
	}
	
	//2.회원 상세 조회
	@GetMapping("/adminMemberDetail")
	public String adminMemberDetail(Model model, MemberVO memberVO) {
		
		//카테고리 목록 조회 후 jsp로 전달
		model.addAttribute("memberDetail", memberService.selectMemberDetail(memberVO));
		

		return "admin/admin_member_detail";
	}
	

	
}
