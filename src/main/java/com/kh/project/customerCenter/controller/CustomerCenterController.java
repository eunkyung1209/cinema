package com.kh.project.customerCenter.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.customerCenter.service.CustomerCenterService;

@Controller
@RequestMapping("/customer")
public class CustomerCenterController {
	//고객센터 기능 구현
	
	@Resource(name = "customerCenterService")
	private CustomerCenterService customerCenterService;
	
	//고객센터 페이지로 이동
	@GetMapping("/goCustomer")
	private String goCustomer(Model model) {
		
		//고객센터 게시글 목록 보내기
		model.addAttribute("customerBoardList", customerCenterService.selectCustomerBoard());
		
		
		return "customer/customer_board_list";
	}
	
	
	
	
	
}
