package com.kh.project.admin.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.community.service.CommunityService;
import com.kh.project.movie.service.MovieService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	//관리자 기능 구현
	
	@Resource(name = "boardService")
	private CommunityService boardService;
	
	@Resource(name = "movieService")
	private MovieService movieService;
	
	//영화 관리 페이지로 이동
	@GetMapping("/movieManage")
	public String movieManage() {
		return "admin/movie_manage";
	}
	
}
