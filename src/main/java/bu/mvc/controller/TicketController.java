package bu.mvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bu.mvc.domain.Counselor;
import bu.mvc.domain.Member;
import bu.mvc.domain.Ticket;
import bu.mvc.service.RefundService;
import bu.mvc.service.TicketService;

@Controller
@RequestMapping("/ticket")
public class TicketController {

	@Autowired
	private TicketService ticketService;
	
	@Autowired
	private RefundService refundService;
	
	/**
	 * 상담권 구매 목록(전체) : 관리자용
	 *  - 전체 리스트 페이징 처리
	 * */
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam(defaultValue = "0") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage, 6, Direction.DESC, "ticketCode");
		Page<Ticket> tkList = ticketService.selectAll(pageable);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ticket/listAdmin");
		mv.addObject("tkList", tkList);
		mv.addObject("previous", pageable.previousOrFirst().getPageNumber());
		mv.addObject("next", pageable.next().getPageNumber());
		return mv;
	}
	
	/**
	 * 나의 상담권 구매 목록 : 로그인한 사용자용
	 *  - 회원 id로 검색하여 사용자 마이페이지에서 출력
	 *  - 검색 결과 페이징 처리
	 * */
	@RequestMapping("/mylist")
	public ModelAndView myList(HttpServletRequest request, @RequestParam(defaultValue = "0") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage, 6, Direction.DESC, "ticketCode");
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Page<Ticket> tkList = ticketService.searchById(member.getId(), pageable);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ticket/listUser");
		mv.addObject("tkList", tkList);
		mv.addObject("previous", pageable.previousOrFirst().getPageNumber());
		mv.addObject("next", pageable.next().getPageNumber());
		return mv;
	}
	
	/**
	 * 구매한 상담권 상세보기
	 *  - 상담사 정보, 상담권 종류, 구매일, 잔여량 표시
	 *  - 사용 / 환불 / 삭제 버튼 존재
	 * */
	@RequestMapping("/read/{code}")
	public ModelAndView ticketDetail(@PathVariable Long code) {
		Ticket ticket = ticketService.selectByCode(code);
		Counselor counselor = ticket.getCounselor();
		int refundState = refundService.selectByTicketCode(code);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ticket/detail");
		mv.addObject("counselor", counselor);
		mv.addObject("ticket", ticket);
		mv.addObject("refundState", refundState);
		
		return mv;
	}
	
	/**
	 * 상담권 구매 폼으로
	 * */
	@RequestMapping("/ticketApp")
	public void paymentApp() {}
	
	/**
	 * 상담권 구매 완료 (결제 성공시)
	 * */
	@RequestMapping("/buy")
	public String buyTicket(Ticket ticket) {
		ticketService.insert(ticket);
		return "redirect:/ticket/mylist";
	}
	
	/**
	 * 상담권 사용하기
	 * */
	@RequestMapping("/use/{code}")
	public String useTicket(@PathVariable Long code) {
		ticketService.useTicket(code);
		return "redirect:/ticket/list";
	}
	
	/**
	 * 소진된 상담권 삭제하기
	 * */
	@RequestMapping("/delete/{code}")
	public String deleteTicket(@PathVariable Long code) {
		ticketService.delete(code);
		return "redirect:/ticket/list";
	}
	
}
