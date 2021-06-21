package bu.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bu.mvc.domain.Notice;
import bu.mvc.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	/**
	 * 공지사항 전체보기
	 * */
	@RequestMapping("/list")
	public ModelAndView selectAll() {
		List<Notice> list = noticeService.selectAll();
		return new ModelAndView("notice/list", "list", list);
	}
	
	/**
	 * 공지사항 글 쓰기 폼
	 * */
	@RequestMapping("/write")
	public void writeForm() {}
	
	/**
	 * 공지사항 등록 하기
	 * */
	@RequestMapping("/insert")
	public String insert(Notice notice) {
		noticeService.insert(notice);
		return "redirect:/notice/list";
	}
	
	/**
	 * 공지사항 상세보기
	 * */
	@RequestMapping("/read/{noticeCode}")
	public ModelAndView selectById(@PathVariable Long noticeCode) {
		Notice notice = noticeService.selectById(noticeCode, true);
		return new ModelAndView("notice/read", "notice", notice);
	}
	
	/**
	 * 공지사항 삭제하기
	 * */
	@RequestMapping("/delete")
	public String delete(Long noticeCode) {
		noticeService.delete(noticeCode);
		return"redirect:/notice/list";
	}
	
	/**
	 * 공지사항 수정하기 폼
	 * */
	@RequestMapping("/updateForm")
	public String updateForm(Long noticeCode, Model model) {
		Notice notice = noticeService.selectById(noticeCode, false);
		model.addAttribute("notice", notice);
		return "notice/update";
	}
	
	/**
	 * 공지사항 수정하기
	 * */
	@RequestMapping("/update")
	public ModelAndView update(Notice notice) {
		Notice dbNotice = noticeService.update(notice);
		return new ModelAndView("notice/read", "notice", dbNotice);
	}

}















