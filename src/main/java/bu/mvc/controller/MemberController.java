package bu.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
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
	public ModelAndView memberUpdate(String password, Long memberCode) {
		//
		Member member = memberService.selectByMember(memberCode);
		if(!passwordEncoder.matches(password, member.getPassword())) {	
			throw new RuntimeException("비밀번호 오류 입니다..");
		}
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberUpdate");
		return mv;
		
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
	@RequestMapping("/memberDelete")
	public String delete(Long memberCode, String password, HttpServletRequest request, HttpServletResponse response) {
		memberService.delete( memberCode, password);
		
		//탈퇴가 되면 로그아웃시킨다.
		Authentication auth =SecurityContextHolder.getContext().getAuthentication();
		if(auth!=null && auth.isAuthenticated()) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		
		return "redirect:/";
	}
	
	@ExceptionHandler(RuntimeException.class)
	public ModelAndView error(RuntimeException e) {
		return new ModelAndView("member/errorView", "errMsg",e.getMessage());
	}
	
	
}
