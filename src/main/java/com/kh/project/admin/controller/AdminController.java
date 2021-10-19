package com.kh.project.admin.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.community.service.CommunityService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	//관리자 기능 구현
	
	@Resource(name = "boardService")
	private CommunityService boardService;
	
}
