package com.kh.project.movie.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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
	public String mainPage(Model model, Date date) {
//		//오늘의 일시
//		model.addAttribute("nowDateAndTime", MovieController.getNowDateAndTime(date));
		//영화 목록
		model.addAttribute("movieList", movieService.selectMovieList());
		
		return "movie/main_page";
		//return "template/main_bin";
	}
	
	//상단 영화 메뉴 클릭 시 이동
	@GetMapping("/movieList")
	public String movieList(Model model) {
		//영화 목록
		model.addAttribute("movieList", movieService.selectMovieList());
		
		return "movie/movie_list";
	}
	
	//영화 상세 페이지로 이동
	@GetMapping("/movieDetail")
	public String movieDetail(Model model, String mvCode) {
		//영화 상세 정보
		model.addAttribute("movieInfo", movieService.selectDetailMovie(mvCode));
		
		return "movie/movie_detail";
	}
	
	//오늘의 일시
//	public String getNowDateAndTime(Date date) {
//		SimpleDateFormat sdf = new SimpleDateFormat("MM.dd HH:mm");
//		String today = sdf.format(date);
//		
//		return today + " 기준";
//	}
	
}
