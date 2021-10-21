package com.kh.project.movie.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.movie.service.MovieService;
import com.kh.project.movie.vo.MovieVO;

@Controller
@RequestMapping("/movie")
public class MovieController {
	//영화 관련 기능 구현
	
	@Resource(name = "movieService")
	private MovieService movieService;
	
	//메인 페이지로 이동
	@GetMapping("/mainPage")
	public String mainPage(Model model) {
		model.addAttribute("movieList", movieService.selectMovieList());
		
		return "movie/main_page";
		//return "template/main_bin";
	}
	
	//상단 영화 메뉴 클릭 시 이동
	@GetMapping("/movieList")
	public String movieList(Model model) {
		model.addAttribute("movieList", movieService.selectAdminMovieList());
		
		return "movie/movie_list";
	}
	
	//영화 상세 페이지로 이동
	@GetMapping("/movieDetail")
	public String movieDetail(Model model, String mvCode) {
		model.addAttribute("movieInfo", movieService.selectDetailMovie(mvCode));
		
		return "movie/movie_datail";
	}
	
}
