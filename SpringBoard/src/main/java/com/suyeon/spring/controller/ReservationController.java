package com.suyeon.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.suyeon.dto.ReservationDto;
import com.suyeon.service.ReservationService;

import lombok.AllArgsConstructor;


@RequestMapping("/reservation/*")
@AllArgsConstructor
@Controller
public class ReservationController {
	
	private ReservationService service;
	
	@GetMapping("/calendar")
	public void calendar() {
		
	}
	
	@PostMapping("/selectedDate")
	public String selectedDate(ReservationDto dto) {
		service.selectedDate(dto);
		return "redirect: /board/login_page";
	}

	
	@GetMapping("/mypage")	
	public void mypage(@RequestParam("user_id") String user_id, Model model ) {
		model.addAttribute("mypageList", service.mypage(user_id));
	}
	
}
