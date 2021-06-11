package bu.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bu.mvc.domain.Ticket;
import bu.mvc.service.TicketService;

@Controller
@RequestMapping("/ticket")
public class TicketController {

	@Autowired
	private TicketService ticketService;
	
	/**
	 * 상담권 구매 목록 (전체 회원)
	 * */
	@GetMapping("/list")
	public void list(Model model, @RequestParam(defaultValue = "0") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "ticketCode");
		Page<Ticket> list = ticketService.selectAll(pageable);
		model.addAttribute("ticketList", list);
	}
	
	/*
	 @GetMapping("/board/search")
    public String search(String keyword, @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable ,Model model) {

        List<Board> searchList = boardService.search(keyword, pageable);

        model.addAttribute("searchList", searchList);

        return "search/searchPage";
    }
	 * */
	
	/**
	 * 나의 상담권 구매 목록
	 * */
	@GetMapping("/mylist/{id}")
	public void myList(Model model, String id, @RequestParam(defaultValue = "0") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "ticketCode");
		List<Ticket> list = ticketService.searchById(id, pageable);
		model.addAttribute("ticketList", list);
	}
	
	
	/**
	 * 상담권 상세보기
	 * */
	
	
	/**
	 * 상담권 구매 페이지로
	 * */
	
	
	/**
	 * 상담권 구매
	 * */
	
	
	/**
	 * 소진된 상담권 삭제하기
	 * */
	
	
}
