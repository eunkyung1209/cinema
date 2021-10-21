package com.kh.project.customerCenter.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.customerCenter.service.CustomerCenterService;
import com.kh.project.customerCenter.vo.CustomerCenterVO;

@Controller
@RequestMapping("/customer")
public class CustomerCenterController {
	//고객센터 기능 구현
	
	@Resource(name = "customerCenterService")
	private CustomerCenterService customerCenterService;
	
	//고객센터 페이지로 이동
	@RequestMapping("/goCustomer")
	private String goCustomer(Model model, CustomerCenterVO customerCenterVO) {
		
		//고객센터 게시글 목록 보내기
		model.addAttribute("customerBoardList", customerCenterService.selectCustomerBoard(customerCenterVO));
		
		return "customer/customer_board_list";
	}
	
	//고객센터 글 작성 페이지로 이동
	@GetMapping("/goWriteCustomer")
	private String goWriteCustomer() {
		return "customer/customer_write_form";
	}
	
	//고객센터 글 등록
	@PostMapping("/insertCustomerBoard")
	private String insertCustomerBoard(CustomerCenterVO customerCenterVO) {
		customerCenterService.insertCustomerBoard(customerCenterVO);
		
		return "redirect:/customer/goCustomer";
	}
	
	//고객센터 글 비번 입력
	@GetMapping("/selectCustomerBoardPw")
	private String selectCustomerBoardPw(CustomerCenterVO customerCenterVO) {
		return "customer/input_password";
	}
	
	//고객센터 글 상세보기
		@GetMapping("/selectCustomerBoardDetail")
		private String selectCustomerBoardDetail(Model model, String customerCode) {
			
			model.addAttribute("customerBoard", customerCenterService.selectCustomerBoardDetail(customerCode));
			return "customer/customer_board_detail";
		}
	
	
	//공지사항 페이지로 이동
	@GetMapping("/goNotice")
	private String goNotice(Model model, CustomerCenterVO customerCenterVO) {
		
		//고객센터 게시글 목록 보내기
		model.addAttribute("customerBoardList", customerCenterService.selectCustomerBoard(customerCenterVO));
		
		return "customer/cusomer_notice_list";
	}
	
	
	
	
	
}
