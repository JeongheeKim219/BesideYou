package bu.mvc.controller;

import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bu.mvc.domain.Contact;
import bu.mvc.domain.Member;
import bu.mvc.hs.service.ContactService;

@Controller
public class ContactController {
	
	@Autowired
	private ContactService contactService;
	
	/**
	 * 관리자만 접속 가능 전체 문의글 가져오기
	 * */
	@RequestMapping("/admin/contactView")
	public void selectAll(Model model ,@RequestParam(defaultValue = "0")int currentPage) {
		Pageable pageable = PageRequest.of(currentPage, 10, Direction.DESC, "contactCode");
		
		Page<Contact> pageList = contactService.selectAll(pageable);
		
		model.addAttribute("contactPageList", pageList);
	}
	
	/**
	 * 회원이 전체 문의글 가져오기
	 * */
	@RequestMapping("/contact/list")
	public void findByMemberMemberCode(Model model ,@RequestParam(defaultValue = "0")int nowPage) {
		
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "contactCode");
		
		Page<Contact> pageList = contactService.findByMemberMemberCode(pageable, member.getMemberCode());
		
		model.addAttribute("pageList", pageList);
	}
	
	/**
	 * 문의글 작성 폼
	 * */
	@RequestMapping("/contact/write")
	public void writeForm() {}
	
	
	/**
	 * 문의글 작성하기
	 * */
	@RequestMapping("/contact/insert")
	public String insert(Contact contact) {
		contactService.insert(contact);
		return "redirect:/contact/list";
	}
	
	/**
	 * 관리자 문의글에서 상세보기
	 * */
	@RequestMapping("/contact/read/{contactCode}")
	public ModelAndView selectById(@PathVariable Long contactCode) {
		Contact contact = contactService.selectById(contactCode);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("contact/read");
		mv.addObject("contact", contact);
		return mv;
	}
	
	/**
	 * 일반회원 문의글에서 상세보기
	 * */
	@RequestMapping("/contact/readUser/{contactCode}")
	public ModelAndView selectBy(@PathVariable Long contactCode) {
		Contact contact = contactService.selectById(contactCode);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("contact/readUser");
		mv.addObject("contact", contact);
		return mv;
	}
	
	
	/**
	 * 관리자가 문의글 삭제하기
	 * */
	@RequestMapping("/contact/delete")
	public String delete(Long contactCode) {
		contactService.delete(contactCode);
		return "redirect:/admin/contactView";
	}
	
	
	/**
	 * 회원이 문의글 삭제하기
	 * */
	@RequestMapping("/contact/deleteUser")
	public String deleteUser(Long contactCode) {
		contactService.delete(contactCode);
		return "redirect:/contact/list";
	}
	
	/**
	 * 수정하기 폼
	 * */
	@RequestMapping("/contact/updateForm")
	public String updateForm(Long contactCode, Model model) {
		Contact contact = contactService.selectById(contactCode);
		model.addAttribute("contact", contact);
		return "contact/update";
	}
	
	/**
	 * 회원이 문의글 수정하기
	 * */
	@RequestMapping("/contact/update")
	public ModelAndView update(Contact contact) {
		Contact dbContact = contactService.update(contact);
		return new ModelAndView("contact/readUser", "contact", dbContact);
	}
	
	/**
	 * 예외처리
	 * */
	@ExceptionHandler(RuntimeException.class)
	public ModelAndView error(RuntimeException e) {
		return new ModelAndView("contact/errorView", "errMsg", e.getMessage());
	}
	
	@RequestMapping("/contact/error")
	public void error() {}
	

}




















