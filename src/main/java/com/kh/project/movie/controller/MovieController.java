package com.kh.project.movie.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.movie.service.MovieService;

@Controller
@RequestMapping("/movie")
public class MovieController {
	//영화 관련 기능 구현
	
	@Resource(name = "movieService")
	private MovieService movieService;
	
	@GetMapping("/mainPage")
	public String mainPage() {
		return "movie/main_page";
	}
	
}
