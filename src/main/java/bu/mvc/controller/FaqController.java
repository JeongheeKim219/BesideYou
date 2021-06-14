package bu.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bu.mvc.domain.Faq;
import bu.mvc.hs.service.FaqService;

@Controller
@RequestMapping("/faq")
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	
	/**
	 * FAQ 전체 보기
	 * */
	@RequestMapping("/list")
	public void selectAll(Model model) {
		List<Faq> list = faqService.selectAll();
		model.addAttribute("list", list);
	}
	
	/**
	 * 주문,결제 FAQ 보기
	 * */
	@RequestMapping("/list0")
	public void selectOne(Model model) {
		List<Faq> list = faqService.selectOne();
		model.addAttribute("list", list);
	}
	
	/**
	 * 상담기록 FAQ 보기
	 * */
	@RequestMapping("/list1")
	public void selectTwo(Model model) {
		List<Faq> list = faqService.selectTwo();
		model.addAttribute("list", list);
	}
	
	/**
	 * 상담기록 FAQ 보기
	 * */
	@RequestMapping("/list2")
	public void selectThree(Model model) {
		List<Faq> list = faqService.selectThree();
		model.addAttribute("list", list);
	}
	
	/**
	 * 상담기록 FAQ 보기
	 * */
	@RequestMapping("/list3")
	public void selectFour(Model model) {
		List<Faq> list = faqService.selectFour();
		model.addAttribute("list", list);
	}
	
	/**
	 * 상담기록 FAQ 보기
	 * */
	@RequestMapping("/list4")
	public void selectFive(Model model) {
		List<Faq> list = faqService.selectFive();
		model.addAttribute("list", list);
	}
	
	/**
	 * 상담기록 FAQ 보기
	 * */
	@RequestMapping("/list5")
	public void selectSix(Model model) {
		List<Faq> list = faqService.selectSix();
		model.addAttribute("list", list);
	}
	
	/**
	 * FAQ 등록하기 폼
	 * */
	@RequestMapping("/write")
	public void writeForm() {}
	
	/**
	 * FAQ 등록하기
	 * */
	@RequestMapping("/insert")
	public String insert(Faq faq) {
		faqService.insert(faq);
		return "redirect:/faq/list"+faq.getFaqCategory();
	}
	
	/**
	 * FAQ 상세보기
	 * */
	@RequestMapping("/read/{faqCode}")
	public ModelAndView selectById(@PathVariable Long faqCode) {
		Faq faq = faqService.selectById(faqCode);
		return new ModelAndView("faq/read", "faq", faq);
	}
	
	/**
	 * FAQ 삭제하기
	 * */
	@RequestMapping("/delete")
	public String delete(Long faqCode) {
		faqService.delete(faqCode);
		return "redirect:/faq/list";
	}
	
	/**
	 * FAQ 수정하기 폼
	 * */
	@RequestMapping("/updateForm")
	public ModelAndView updateForm(Faq faq) {
		Faq dbFaq = faqService.selectById(faq.getFaqCode());
		return new ModelAndView("faq/update", "faq", dbFaq);
	}
	
	/**
	 * FAQ 수정하기
	 * */
	@RequestMapping("/update")
	public ModelAndView update(Faq faq) {
		Faq dbFaq = faqService.update(faq);
		return new ModelAndView("faq/read", "faq", dbFaq);
	}
	

}



















