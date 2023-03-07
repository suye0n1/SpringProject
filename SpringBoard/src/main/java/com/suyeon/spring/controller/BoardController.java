package com.suyeon.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.suyeon.dto.BoardDto;
import com.suyeon.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
@SessionAttributes("login") // 로그인, 카테고리 세션
@Controller
public class BoardController {

	private BoardService service;

	// 1.리스트
	@GetMapping("/list")
	public void list(@RequestParam(value = "category") String category, Model model) {
		model.addAttribute("category", category);
		model.addAttribute("list", service.list(category));
	}

	// 2.읽기
	@GetMapping({ "/read", "/modify" })
	public void read(BoardDto dto, Model model) {
		log.info("컨트롤러" + dto.getNum());
		model.addAttribute("read", service.read(dto.getNum(), dto.getCategory()));
	}

	// 삭제
	@GetMapping("/del")
	public String del(@RequestParam("num") Long num, @RequestParam("category") String category, HttpSession session) {
		log.info("컨트롤러" + num);
		service.del(num);
//		return "redirect:/board/list?category=" + session.getAttribute("category");
		return "redirect:/board/list?category="+category;
	}

//	쓰기 화면 출력
	@GetMapping("/write")
	public void write(@RequestParam("category") String category, Model model) {
		log.info("===================");
		model.addAttribute("category",category);
	}
//	@SessionAttributes("category")을 해주게 되면 return "redirect:/board/list?category="+dto.getCategory();는 /board/list?category=free&category=free로 나와서 리스트 출력이 안됨
	// 쓰기
//todo 글쓰고 리스트에 뿌릴 때 로그인한 user_id가 나오도록
	@PostMapping("/write")
	public String write(BoardDto dto) {
		service.write(dto);
		log.info("==================="+dto.getCategory());
		return "redirect:/board/list?category="+dto.getCategory();
//		return "redirect:/board/list";
	}

	// 수정
	@PostMapping("/modify")
	public String modify(BoardDto dto, @RequestParam("category") String category) {
		service.modify(dto);
		return "redirect:/board/list?category="+category;
	}
}
