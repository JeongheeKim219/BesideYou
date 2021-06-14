package bu.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bu.mvc.domain.Contact;
import bu.mvc.hs.service.ContactService;

@Controller
@RequestMapping("/contact")
public class ContactController {
	
	@Autowired
	private ContactService contactService;
	
	/**
	 * 전체 문의글 가져오기
	 * */
	@RequestMapping("/list")
	public void selectAll(Model model ,@RequestParam(defaultValue = "0")int nowPage) {
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "contactCode");
		
		Page<Contact> pageList = contactService.selectAll(pageable);
		
		model.addAttribute("pageList", pageList);
	}
	
	/**
	 * 문의글 작성 폼
	 * */
	@RequestMapping("/write")
	public void writeForm() {}
	
	/**
	 * 문의글 작성하기
	 * */
	@RequestMapping("/insert")
	public String insert(Contact contact) {
		contactService.insert(contact);
		return "redirect:/contact/list";
	}
	
	/**
	 * 상세보기
	 * */
	@RequestMapping("/read/{contactCode}")
	public ModelAndView selectById(@PathVariable Long contactCode) {
		Contact contact = contactService.selectById(contactCode);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("contact/read");
		mv.addObject("contact", contact);
		return mv;
	}
	
	/**
	 * 삭제하기
	 * */
	@RequestMapping("/delete")
	public String delete(Long contactCode) {
		contactService.delete(contactCode);
		return "redirect:/contact/list";
	}
	
	/**
	 * 수정하기 폼
	 * */
	@RequestMapping("/updateForm")
	public String updateForm(Long contactCode, Model model) {
		Contact contact = contactService.selectById(contactCode);
		model.addAttribute("contact", contact);
		return "contact/update";
	}
	
	/**
	 * 수정하기
	 * */
	@RequestMapping("/update")
	public ModelAndView update(Contact contact) {
		Contact dbContact = contactService.update(contact);
		return new ModelAndView("contact/read", "contact", dbContact);
	}
	

}




















