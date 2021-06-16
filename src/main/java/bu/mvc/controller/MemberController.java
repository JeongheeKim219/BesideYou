package bu.mvc.controller;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bu.mvc.domain.Member;
import bu.mvc.service.MemberService;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
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
	/**
	 * 로그인 폼
	 * */
	@RequestMapping("/login")
	public void loginForm() {	}
	
	//아이디 중복확인
	@RequestMapping("idcheckAjax")
	@ResponseBody
	public String idCheckAjax(HttpServletRequest request) {
		return memberService.idcheck(request.getParameter("id"));
		}
	/**
	 * 아이디찾기 폼
	 * */
	@RequestMapping("/idCheckForm")
	
	public void idCheckForm() {
		
		
	}
	/**
	 * 아이디찾기
	 * */
	@RequestMapping("/idCheck")
	public String idCheck(Member member, Model model) {
		//이름, 생년월요일
		//생년월이 - LocalDate변경
		
		//member.setDateOfBirth(???);
		
		String searchId = memberService.idFind(member);
		model.addAttribute("searchId", searchId);
		
		//System.out.println(member);
		return "member/idCheckSuccess";
	}
	/**
	 * 비밀번호찾기 폼
	 * */
	@RequestMapping("/passCheckForm")
	public void passCheckForm() {
		
	}
	
	/**
	 * 비밀번호 찾기
	 * */
	@RequestMapping("/passCheck")
	public String passCheck(Member member, Model model) {
		
		String serachPass = memberService.passFind(member);
		model.addAttribute("serachPass", serachPass);
		return "member/passCheckSuccess";
	}
	/**
	 * 회원정보 (회원) 
	 * */
	@RequestMapping("/read")
	public ModelAndView read( Long memberCode) {
	
		
		Member member = memberService.selectByMember(memberCode);
		
		
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/read");
		mv.addObject("member", member);
		return mv;
	}
	/**
	 * 회원정보 수정폼(회원)
	 * */
	@RequestMapping("/memberUpdate")
	public void memberUpdate(String pass) {
		//
		//Member me =(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//me.
	}
	/**
	 * 회원정보 수정하기(회원)
	 * */
	@RequestMapping("/update")
	public ModelAndView updateMember(HttpServletRequest request, Member member) {
		//System.out.println("1. MemberVO  :: "+member);
		Member me =(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//System.out.println("2. Spring Security 세션 수정 전 회원정보:" + me);
			
		//변경할 비밀번호를 암호화한다 
		String encodePassword=passwordEncoder.encode(member.getPassword());
		member.setPassword(encodePassword);
		
		memberService.updateMember(member);
		
		
		//System.out.println("member : "+member);
		me.setPassword(encodePassword);
		me.setAlias(member.getAlias());
		me.setEmail(member.getEmail());
		me.setPhone(member.getPhone());
		
		
		
		return new ModelAndView("member/read");
	}
	
	/**
	 * 탈퇴하기
	 * */
	/*@RequestMapping("/delete")
	public String delete(Long memberCode, String password) {
		memberService.delete(memberCode, password);
		
		return "redirect:/";
	}*/
	
	@ExceptionHandler(RuntimeException.class)
	public ModelAndView error(RuntimeException e) {
		return new ModelAndView("member/errorView", "errMsg",e.getMessage());
	}
	
	
}
