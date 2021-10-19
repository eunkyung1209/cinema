package com.kh.project.customerCenter.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.customerCenter.service.CustomerCenterService;

@Controller
@RequestMapping("/customerCenter")
public class CustomerCenterController {
	//고객센터 기능 구현
	
	@Resource(name = "customerCenterService")
	private CustomerCenterService customerCenterService;
	
}
