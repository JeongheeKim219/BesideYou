package bu.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bu.mvc.domain.TicketLines;
import bu.mvc.service.TicketLinesService;

@Controller
@RequestMapping("/ticketLines")
public class TicketLinesController {

	@Autowired
	private TicketLinesService ticketLinesService;
	
	/**
	 * 상담권 사용 내역 전체보기 : 관리자
	 * */
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam(defaultValue = "0") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "ticketCode");
		Page<TicketLines> tlList = ticketLinesService.selectAll(pageable);
		return new ModelAndView("admin/viewTicketLines", "tlList", tlList);
	}
	
	/**
	 * 회원 id로 상담권 사용 내역 검색하기 : 로그인한 사용자
	 * */
	@RequestMapping("/mylist")
	public ModelAndView myList(String id, @RequestParam(defaultValue = "0") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "ticketCode");
		List<TicketLines> myList = ticketLinesService.searchById(id, pageable);
		return new ModelAndView("ticket/ticketLines", "myList", myList);
	}
	
	/**
	 * 상담권 사용 내역 삭제하기
	 * */
	@RequestMapping("/delete")
	public String delete(Long ticketLinesCode) {
		ticketLinesService.delete(ticketLinesCode);
		return "redirect:/ticketLines/mylist";
	}
	
}
