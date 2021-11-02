package com.kh.project.event.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.kh.project.event.service.EventService;

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
}
