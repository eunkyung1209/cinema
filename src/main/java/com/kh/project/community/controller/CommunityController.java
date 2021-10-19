package com.kh.project.community.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.community.service.CommunityService;

@Controller
@RequestMapping("/board")
public class CommunityController {
	//커뮤니티 기능 구현
	
	@Resource(name = "boardService")
	private CommunityService boardService;
	
}
