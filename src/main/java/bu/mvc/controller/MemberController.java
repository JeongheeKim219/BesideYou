package bu.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bu.mvc.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	/**
	 * 회원가입 폼
	 * */
	@RequestMapping("/join")
	public void join() {		
	}
	
	
	/**
	 * 로그인 폼
	 * */
	@RequestMapping("/loginForm")
	public void loginForm() {	}
	
}
