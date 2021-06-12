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

import bu.mvc.domain.Ticket;
import bu.mvc.service.TicketService;

@Controller
@RequestMapping("/ticket")
public class TicketController {

	@Autowired
	private TicketService ticketService;
	
	/**
	 * 상담권 구매 목록(전체) : 관리자용
	 *  - 전체 리스트 페이징 처리
	 * */
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam(defaultValue = "0") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "ticketCode");
		Page<Ticket> tkList = ticketService.selectAll(pageable);
		return new ModelAndView("ticket/listAdmin", "tkList", tkList);
	}
	
	/**
	 * 나의 상담권 구매 목록 : 로그인한 사용자용
	 *  - 회원 id로 검색하여 사용자 마이페이지에서 출력
	 *  - 검색 결과 페이징 처리
	 * */
	@RequestMapping("/myList")
	public ModelAndView myList(String id, @RequestParam(defaultValue = "0") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "ticketCode");
		List<Ticket> myList = ticketService.searchById(id, pageable);
		return new ModelAndView("ticket/list", "myList", myList);
	}
	
	/**
	 * 구매한 상담권 상세보기
	 *  - 연결되는 페이지에 구매한 금액, 상담권 잔여량, 환불 신청 버튼 있음
	 * */
	@RequestMapping("/read")
	public ModelAndView ticketDetail(Long ticketCode) {
		Ticket ticket = ticketService.selectByCode(ticketCode);
		return new ModelAndView("ticket/detail", "ticket", ticket);
	}
	
	/**
	 * 상담권 구매 폼으로
	 * */
	@RequestMapping("/application")
	public void payment() {}
	
	/**
	 * 상담권 구매 완료 (결제 성공시)
	 * */
	@RequestMapping("/buy")
	public String ticketBuy(Ticket ticket) {
		ticketService.insert(ticket);
		return "redirect:/ticket/myList";
	}
	
	/**
	 * 소진된 상담권 삭제하기
	 * */
	@RequestMapping("/delete")
	public String delete(Long ticketCode) {
		ticketService.delete(ticketCode);
		return "redirect:/ticket/myList";
	}
	
}
