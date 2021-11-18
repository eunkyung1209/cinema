package com.kh.project.customerCenter.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.project.common.util.FileUploadUtil;
import com.kh.project.customerCenter.service.CustomerCenterService;
import com.kh.project.customerCenter.vo.CustomerCenterImgVO;
import com.kh.project.customerCenter.vo.CustomerCenterReplyVO;
import com.kh.project.customerCenter.vo.CustomerCenterVO;

@Controller
@RequestMapping("/customer")
public class CustomerCenterController {
	// 고객센터 기능 구현

	@Resource(name = "customerCenterService")
	private CustomerCenterService customerCenterService;

	// 고객센터 페이지로 이동
	@RequestMapping("/goCustomer")
	private String goCustomer(Model model, CustomerCenterVO customerCenterVO) {
		
		//-----페이징 처리------//
		//전체 데이터 수
		int dataCnt = customerCenterService.selectCustomerCnt(customerCenterVO);
		customerCenterVO.setTotalCnt(dataCnt);
		//페이징처리
		customerCenterVO.setPageInfo();
		
		
		// 고객센터 게시글 목록 보내기
		model.addAttribute("customerBoardList", customerCenterService.selectCustomerBoard(customerCenterVO));
		
		return "customer/customer_board_list";
	}

	// 고객센터 글 작성 페이지로 이동
	@GetMapping("/goWriteCustomer")
	private String goWriteCustomer() {
		return "customer/customer_write_form";
	}

	// 고객센터 글 등록
	@PostMapping("/insertCustomerBoard")
	private String insertCustomerBoard(CustomerCenterVO customerCenterVO, MultipartHttpServletRequest multi)
	{
		// 파일이 첨부되는 input태그의 name 속성 값
		 Iterator<String> inputNames = multi.getFileNames();

		// 첨부될 폴더
		// 학원 -> "C:\\Users\\kh202-24\\git\\cinema\\src\\main\\webapp\\resources\\images\\customer\\";
		// 집 -> 
		//String uploadPath = "C:\\Users\\YJH\\git\\cinema\\src\\main\\webapp\\resources\\images\\customer\\";
		String uploadPath = "D:\\workspaceSTS\\Cinema\\src\\main\\webapp\\resources\\images\\movie\\";	//은경 - 학원 컴

		// 모든 첨부파일 정보가 들어갈 공간
		List<CustomerCenterImgVO> imgList = new ArrayList<>();

		// 다음에 들어갈 CUSTOMER_IMG_CODE의 숫자를 조회
		int nextImgCode = customerCenterService.selectNextCustomerImgCode();
		String a = String.format("%03d", nextImgCode);

		// 다음에 들어갈 CUSTOMER_CODE 조회
		String customerCode = customerCenterService.selectNextCustomerCode();

		 while (inputNames.hasNext()) { 
			String inputName = inputNames.next();
		 
		 //실제 첨부기능 
		 try { //다중첨부 
			 if(inputName.equals("file2")) {
				 
				List<MultipartFile> fileList = multi.getFiles(inputName);
		  
				  for(MultipartFile file : fileList) { 
					  String attachedFileName = FileUploadUtil.getNowDateTime() + "_" + file.getOriginalFilename(); 
					  String uploadFile = uploadPath + attachedFileName; 
					  file.transferTo(new File(uploadFile)); //2021101310101425
				  
					  CustomerCenterImgVO img = new CustomerCenterImgVO();
					  img.setCustomerImgCode("CSI_" + String.format("%03d", nextImgCode++));
					  img.setOriginImgName(file.getOriginalFilename());
					  img.setAttachedImgName(attachedFileName); img.setCustomerCode(customerCode);
					  img.setCustomerCode(customerCode);
					  
					  imgList.add(img); 
				  } 
		  
		}
		  
			else { //단일 첨부
				MultipartFile file = multi.getFile(inputName);
				String attachedFileName = FileUploadUtil.getNowDateTime() + "_" + file.getOriginalFilename();
				String uploadFile = uploadPath + attachedFileName;
				file.transferTo(new File(uploadFile)); //2021101310101425
				
				CustomerCenterImgVO img = new CustomerCenterImgVO(); 
				  img.setCustomerImgCode("CSI_" + String.format("%03d", nextImgCode++));
				  img.setOriginImgName(file.getOriginalFilename());
				  img.setAttachedImgName(attachedFileName); img.setCustomerCode(customerCode);
				  img.setCustomerCode(customerCode);
				
				 imgList.add(img);
			}
			
		 	} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		// ------------고객센터 게시판 insert------------//
		customerCenterVO.setCustomerCode(customerCode);
		customerCenterService.insertCustomerBoard(customerCenterVO);
		
		// ------------상품 이미지 정보 insert---------//
		customerCenterVO.setImgList(imgList);
		customerCenterService.insertCustomerImg(customerCenterVO);

		return "redirect:/customer/goCustomer";
	}

	// 고객센터 글 비번 입력
	@GetMapping("/selectCustomerBoardPw")
	private String selectCustomerBoardPw(CustomerCenterVO customerCenterVO) {
		return "customer/input_password";
	}

	// 고객센터 글 상세보기
	@GetMapping("/selectCustomerBoardDetail")
	private String selectCustomerBoardDetail(Model model, String customerCode, CustomerCenterVO customerCenterVO) {
		
		//관리자가 클릭 시 조회 여부 업데이트
		customerCenterService.updateIsRead(customerCode);
		//상세보기 정보
		model.addAttribute("customerBoard", customerCenterService.selectCustomerBoardDetail(customerCode));
		//댓글 목록 불러오기
		model.addAttribute("customerReplyList", customerCenterService.selectCustomerReply(customerCode));
		
		return "customer/customer_board_detail";
	}

	// 공지사항 페이지로 이동
	@GetMapping("/goNotice")
	private String goNotice(Model model, CustomerCenterVO customerCenterVO) {

		//-----페이징 처리------//
		//전체 데이터 수
		int dataCnt = customerCenterService.selectCustomerCnt(customerCenterVO);
		customerCenterVO.setTotalCnt(dataCnt);
		//페이징처리
		customerCenterVO.setPageInfo();
		
		// 고객센터 게시글 목록 보내기
		model.addAttribute("customerBoardList", customerCenterService.selectNoticeBoard(customerCenterVO));

		return "customer/cusomer_notice_list";
	}
	
	//내 상담내역 페이지로 이동
	@GetMapping("/goMyCustomer")
	private String goMyCustomer(Model model, CustomerCenterVO customerCenterVO) {
		
		//-----페이징 처리------//
		//전체 데이터 수
		int dataCnt = customerCenterService.selectCustomerCnt(customerCenterVO);
		customerCenterVO.setTotalCnt(dataCnt);
		//페이징처리
		customerCenterVO.setPageInfo();
		
		//나의 상담내역 목록 보내기
		model.addAttribute("customerBoardList", customerCenterService.selectMyCustomer(customerCenterVO));
		return "customer/my_customer_list";
	}
	
	//로그인 안했을 때 상담내역 페이지로 이동
	@GetMapping("/goMyCustomerX")
	private String goMyCustomerX() {
		
		return "customer/my_customer_list_loginX";
	}
	
	//고객센터 글 수정
	@GetMapping("/goUpdateCustomer")
	private String goUpdateCustomer(Model model, CustomerCenterVO customerCenterVO, String customerCode) {
		
		//원래 작성했던 내용 
		model.addAttribute("customerBoard", customerCenterService.selectCustomerBoardDetail(customerCode));
		return "customer/update_customer";
	}
	
	//글 수정해주기
	@PostMapping("/updateCustomer")
	private String updateCustomer(Model model, CustomerCenterVO customerCenterVO) {
		
		customerCenterService.updateCustomer(customerCenterVO);
		return "redirect:/customer/goCustomer";
	}
	
	//댓글 등록
	@PostMapping("/insertCustomerReply")
	private String insertCustomerReply(Model model, CustomerCenterReplyVO customerCenterReplyVO) {
		
		customerCenterService.insertCustomerReply(customerCenterReplyVO);
		//등록 후 다시 페이지로 돌아가기
		model.addAttribute("customerCode", customerCenterReplyVO.getCustomerCode());
		
		return "redirect:/customer/selectCustomerBoardDetail";
	}
	
	//분실물 페이지 이동
	@GetMapping("/goLost")
	private String selectCustomerLost(Model model, CustomerCenterVO customerCenterVO) {
		
		//-----페이징 처리------//
		//전체 데이터 수
		int dataCnt = customerCenterService.selectCustomerCnt(customerCenterVO);
		customerCenterVO.setTotalCnt(dataCnt);
		//페이징처리
		customerCenterVO.setPageInfo();
		
		
		model.addAttribute("customerBoardList", customerCenterService.selectCustomerLost(customerCenterVO));
		
		return "customer/customer_lost";
	}
	
	//게시물 삭제
	@GetMapping("/deleteCustomer")
	private String deleteCustomer(Model model, String customerCode) {
		
		customerCenterService.deleteCustomer(customerCode);	
		
		return "redirect:/customer/goCustomer";
	}
	
	//댓글 삭제
	@GetMapping("/deleteCustomerReply")
	private String deleteCustomerReply(String customeReplyCode, String customerCode, Model model) {
		
		customerCenterService.deleteCustomerReply(customeReplyCode);
		
		//상세보기 페이지 코드 넘겨주기
		model.addAttribute("customerCode", customerCode);
		
		return "redirect:/customer/selectCustomerBoardDetail";
	}
	
	//댓글 수정
	@PostMapping("updateReply")
	private String updateCustomerReply(Model model, CustomerCenterReplyVO customerCenterReplyVO) {
		
		customerCenterService.updateCustomerReply(customerCenterReplyVO);
		
		//상세보기 페이지 코드 넘겨주기
		model.addAttribute("customerCode", customerCenterReplyVO.getCustomerCode());
		
		return "redirect:/customer/selectCustomerBoardDetail";
	}

}
