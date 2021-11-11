package com.kh.project.event.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.project.event.service.EventService;
import com.kh.project.event.vo.EventVO;

@Controller
@RequestMapping("/event")
public class EventController {
	//이벤트 관련 기능
	
	@Resource(name = "eventService")
	private EventService eventService;
	
	// 이벤트 페이지로 이동
	@GetMapping("/eventMain")
	public String eventMain() {
		return "event/eventMain";
		
	}
	//이벤트 영화상세보기 페이지로 이동
	@GetMapping("/eventDetail")
		public String eventDetail() {
			return "event/detail_movie";
			
	}
	//이벤트 영화상세보기_1 페이지로 이동
		@GetMapping("/eventDetail_1")
			public String eventDetail_1() {
				return "event/detail_movie_1";
				
	}
	
	//이벤트 영화상세보기_2 페이지로 이동
		@GetMapping("/eventDetail_2")
			public String eventDetail_2() {
				return "event/detail_movie_2";
				
	}
	// 이벤트 시사회/무대인사 페이지로 이동
		@GetMapping("/detailPremiere")
		public String detailPremiere() {
			return "event/detail_premiere";
			
	}
	// 이벤트 시사회/무대인사_1 페이지로 이동
		@GetMapping("/detailPremiere_1")
		public String detailPremiere_1() {
			return "event/detail_premiere_1";
	}
	// 이벤트 시사회/무대인사_2 페이지로 이동
		@GetMapping("/detailPremiere_2")
		public String detailPremiere_2() {
		return "event/detail_premiere_2";
	}
	// 이벤트 제휴할인 페이지로 이동
		@GetMapping("/detail_discount")
		public String detail_discount() {
			return "event/detail_discount";
		
		
	}
	// 이벤트 제휴할인_1 페이지로 이동
		@GetMapping("/detail_discount_1")
		public String detail_discount_1() {
			return "event/detail_discount_1";
		
	}
	// 이벤트 행사일정으로 이동
		@GetMapping("/eventDate")
		public String eventDate(Model model) {
			model.addAttribute("eventList", eventService.selectEvent());
			return "event/event_Date";
	}
	//해당일 이달의 행사일정 조회	
	@ResponseBody
	@PostMapping("/eventAjax")
	public List<EventVO> selectEventAjax(EventVO evnetVO) {
		
		return eventService.selectEventAjax(evnetVO);
	}
	
}
