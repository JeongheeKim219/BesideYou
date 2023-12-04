package bu.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import bu.mvc.domain.Contact;
import bu.mvc.domain.ContactReply;
import bu.mvc.service.ContactReplyService;

@Controller
public class ContactReplyController {
	
	@Autowired
	private ContactReplyService contactReplyService;
	
	
	/**
	 * 답변 폼
	 * */
	@RequestMapping("/admin/contactDetailView")
	public void writeForm(Long contactCode, Model model) {
		Contact contact = contactReplyService.selectById(contactCode);
		model.addAttribute("contact", contact);
	}
	
	/**
	 * 답변 등록하기
	 * */
	@RequestMapping("/admin/insertContactReply")
	public String insert(ContactReply contactReply, Long contactCode) {
		contactReply.setContact(new Contact(contactCode));
		
		contactReplyService.insert(contactReply);
		
		return "redirect:/contact/read/"+contactCode;
	}
	
	/**
	 * 답변 삭제하기
	 * */
	@RequestMapping("/contactReply/delete/{contactReplyCode}/{contactCode}")
	public String delete(@PathVariable Long contactReplyCode, @PathVariable Long contactCode) {
		contactReplyService.delete(contactReplyCode);
		return "redirect:/contact/read/"+contactCode;
	}

}






















