package bu.mvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bu.mvc.domain.Member;
import bu.mvc.service.MemberService;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	/**
	 * 가입 폼
	 * */
	@RequestMapping("/joinForm")
	public void joinForm() {	}
	
	/**
	 * 가입하기
	 * */
	@RequestMapping("/join")
	public String join(Member member) {
		memberService.joinMember(member);
		return "member/joinSuccess";
	}
	//아이디 중복확인
	@RequestMapping("idcheckAjax")
	@ResponseBody
	public String idCheckAjax(HttpServletRequest request) {
		return memberService.idcheck(request.getParameter("id"));
		}
	
	
	/**
	 * 로그인 폼
	 * */
	@RequestMapping("/login")
	public void loginForm() {	}
	
}
