package com.kh.project.movie.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.common.util.NowDateTime;
import com.kh.project.movie.service.MovieService;
import com.kh.project.movie.vo.MovieReplyVO;
import com.kh.project.movie.vo.MovieVO;

@Controller
@RequestMapping("/movie")
public class MovieController {
	//영화 관련 기능 구현
	
	@Resource(name = "movieService")
	private MovieService movieService;
	
	//메인 페이지로 이동
	@GetMapping("/mainPage")
	public String mainPage(Model model/* , Date date */) {
		//현재 일시
		model.addAttribute("nowDateAndTime", NowDateTime.getNowDateTime());
		
		//영화 목록
		model.addAttribute("movieList", movieService.selectMainMovieList());
		
		return "movie/main_page";
		//return "template/main_bin";
	}
	
	//상단 영화 메뉴 클릭 시 이동
	@RequestMapping("/movieList")
	public String movieList(Model model, MovieVO movieVO) {
		//영화 목록
		model.addAttribute("movieList", movieService.selectMovieList(movieVO));
		
		return "movie/movie_list";
	}
	
	//영화 상세 페이지로 이동
	@GetMapping("/movieDetail")
	public String movieDetail(Model model, MovieVO movieVO) {
		//영화 상세 정보
		model.addAttribute("movieInfo", movieService.selectDetailMovie(movieVO));
		
		//댓글 목록
		model.addAttribute("replyList", movieService.selectReplyList(movieVO));

		//영화 평점 수정
		movieService.updateGrade(movieVO);
		
		return "movie/movie_detail";
	}
	
	//영화 댓글 등록
	@PostMapping("/insertReply")
	public String insertReply(HttpSession session, MovieReplyVO movieReplyVO, Model model) {
		//댓글 등록
		movieService.insertReply(movieReplyVO);
		
		//영화 코드
		model.addAttribute("mvCode", movieReplyVO.getMvCode());
		
		return "redirect:/movie/movieDetail";
	}
	
	//영화 댓글 수정
	@PostMapping("/updateReply")
	public String updateReply(MovieReplyVO movieReplyVO, Model model) {
		//댓글 수정
		movieService.updateReply(movieReplyVO);
		
		//영화 코드
		model.addAttribute("mvCode", movieReplyVO.getMvCode());
		
		return "redirect:/movie/movieDetail";
	}
	
	//영화 댓글 삭제
	@GetMapping("/deleteReply")
	public String deleteReply(MovieReplyVO movieReplyVO, Model model) {
		//댓글 삭제
		movieService.deleteReply(movieReplyVO);
		
		//영화 코드
		model.addAttribute("mvCode", movieReplyVO.getMvCode());
		
		return "redirect:/movie/movieDetail";
	}
	
}
