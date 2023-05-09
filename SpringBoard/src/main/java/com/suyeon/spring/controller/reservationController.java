package com.suyeon.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@RequestMapping("/reservation/*")
@AllArgsConstructor
@Controller
public class reservationController {
	
	@GetMapping("/calendar")
	public void calendar() {
		
	}
	
	@GetMapping("/exercise")
	public void exercise() {
		
	}
	
}
