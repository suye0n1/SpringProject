package com.suyeon.spring.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.suyeon.dto.MemberDto;
import com.suyeon.service.MemberService;
import com.suyeon.session.SessionUtils;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
@Controller
public class MemberController {

	@Autowired 
	private MemberService service;

	@Autowired
	private JavaMailSender mailSender;

	// spring-security.xml BCryptPasswordEncoder클래스가 bean객체 생성
	@Inject // 의존성 주입
	private BCryptPasswordEncoder pwEncoder; // 객체 생성

	
	@RequestMapping(value = "join", method = RequestMethod.GET) // 1-2(2)
	public void loginGET() {
	}

	@PostMapping("/joinMember")
	public String join(HttpServletRequest request, MemberDto dto) {
		System.out.println("암호화 전:" + dto.getPasswd());
		String inputPw = dto.getPasswd(); // 패스워드 가져오기
		String encPassword = pwEncoder.encode(inputPw); // 암호화하기
		dto.setPasswd(encPassword); // 암호화한 패스워드 보내기
		System.out.println("암호화 후:" + encPassword);
		service.join(dto); // 회원가입 폼 db로 저장
		return "redirect:/";

	}

	// 아이디 중복 확인
	@GetMapping("/idCheck")
	public String idCheck(@RequestParam("user_id") String user_id, Model model) {
		System.out.println("id 가져옴" + user_id);
		int result = service.idCheck(user_id); // db에서 중복 확인
		model.addAttribute("result", result); // xml에서 db 쿼리 확인한 값 저장하기 / 값을 가지고 idCheck.jsp로 이동
		model.addAttribute("user_id", user_id); // user_id 저장하기
		return "/member/idCheck"; // redirect 사용하면 컨트롤러를 거치고 안하면 jsp파일로 이동
	}

	// 이메일 인증
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception { // ajax를 통한 요청으로 인해 뷰로 다시 반환할 때 데이터타입은 String타입만 가능
		log.info("이메일 데이터 전송 확인");
		log.info("인증번호:" + email);

		// 인증번호(난수) 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호" + checkNum);

		// 이메일 보내기
		// root-context.xml에 삽입한 자신의 이메일 계정
		String setFrom = "websitecommunity11@gmail.com";
		// 수신받을 이메일
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try { // MimeMessage객체 생성 //createMimeMessage()메서드는 JavaMailSender인터페이스에 정의되어있음
			MimeMessage message = mailSender.createMimeMessage(); // true는 메시지를 사용하겠다는 의미
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (Exception e) {
		
			e.printStackTrace();
		}

		String num = Integer.toString(checkNum);

		return num;
	}

	// 3.로그인 화면
	@GetMapping("/login")
	public void login() {

	}

	@GetMapping("/login_check")
	public String login(HttpServletRequest request, MemberDto dto, Model model) throws Exception {
		try {
			MemberDto savedUser = service.login(dto.getUser_id());
			if (savedUser != null) { // savedUser가 null이 아니고
//				pwEncoder.matches(savedUser.getPasswd(), dto.getPasswd())로 작성하면 오류
//				pwEncoder.matches(유저가 작성한 비밀번호, db에서 가져온 비밀번호)로 작성
				if (pwEncoder.matches(dto.getPasswd(), savedUser.getPasswd())) {// 비밀번호가 일치하면(matches로 비교)
					System.out.println("비밀번호 일치");
					dto.setPasswd(savedUser.getPasswd()); // 암호화된 비번을 dto에 보내기
					SessionUtils.setObject(request, "login_user", savedUser); // 저장된 유저아이디를 login_user에 저장
				} else { // 비밀번호가 일치하지 않으면
					System.out.println("비밀번호 불일치");
					return "redirect:/member/login"; // 로그인페이지로 이동
				}
			} else { // 아이디가 일치하지 않으면
				System.out.println("아이디 없음");
				return "redirect:/member/login"; // 로그인페이지로 이동
			}

		} catch (NullPointerException npe) {
			dto = null;
		} catch (Exception e) {
			dto = null;
		}
		return "redirect:/board/login_page"; // try구문에서 if문 false 나올 때 return값을 작성 안하면 catch구문으로 이동하기 때문에 return값 작성해주기
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		SessionUtils.removeObject(request, "login_user");
		return "redirect:/";
	}
}
