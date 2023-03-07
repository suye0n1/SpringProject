package com.suyeon.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.suyeon.dto.MemberDto;
import com.suyeon.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
@SessionAttributes("login")
@Controller
public class MemberController {
	
	@Autowired	//1-2(1)
	private MemberService service;
	
	//1-2회원가입 페이지 이동
	@RequestMapping(value="join", method=RequestMethod.GET)	//1-2(2)
	public void loginGET() {
	}
	
	//1-1회원가입 페이지 이동 방법
//	@GetMapping("/join")
//	public void join() {
//	
//	}
	
	
	//2.회원가입
//	@PostMapping("/join")
//	public String join(MemberDto dto, Model model) {
//		log.info(dto.getUser_id());
//		log.info(dto.getEmail());
//		service.join(dto);
//		return "redirect:/board/list";
//	}

	
//	@GetMapping("/join")
//	public void join(@RequestParam(value = "location", defaultValue = "/") String location, Model model) {
//		model.addAttribute("location", location);
//	}
	
	@GetMapping("/joinMember")
	public String join(HttpServletRequest request, MemberDto dto) {
		service.join(dto);
		return "redirect:/";
		
	}

	//아이디 중복 확인
//	@GetMapping("/idCheck")
//	public String idCheck(@RequestParam("user_id") String user_id, Model model) {	//join.jsp에서 userid 가져오기
//		log.info("넘어옴" + user_id);
//		 service.idCheck(user_id);
//			RequestParam user_id와 쿼리에서 가져온 user_id가 같으면 중복
//				model.addAttribute("user_id",user_id);
//			return "/member/join";
//	}
	
	//아이디 중복 확인
	@GetMapping("/idCheck")
	public String idCheck(@RequestParam("user_id") String user_id, Model model) {
			System.out.println("id 가져옴"+user_id);
			int result = service.idCheck(user_id);	//db에서 중복 확인
			model.addAttribute("result", result);	//xml에서 db 쿼리 확인한 값 저장하기 / 값을 가지고 idCheck.jsp로 이동
			model.addAttribute("user_id",user_id);	//user_id 저장하기
			return "/member/idCheck";	//redirect 사용하면 컨트롤러를 거치고 안하면 jsp파일로 이동	
	}
	
	
	//3.로그인 화면
	@GetMapping("/login")
	public void login() {
		
	}
	//4.로그인 체크&확인
	@GetMapping("/login_check")
	public String login(@RequestParam("user_id") String user_id, @RequestParam("passwd") String passwd, Model model) {
		MemberDto Login = service.login(user_id, passwd);
		System.out.println("로그인");
		if(Login != null) {
			model.addAttribute("login", Login);
			return "redirect:/board/list?category=free";
		}	else {
			//경고문
			return "redirect:/member/login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}
}
