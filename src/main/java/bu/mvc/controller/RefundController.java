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
import bu.mvc.domain.Refund;
import bu.mvc.domain.Ticket;
import bu.mvc.service.RefundService;
import bu.mvc.service.TicketService;

@Controller
@RequestMapping("/refund")
public class RefundController {

	@Autowired
	private RefundService refundService;
	
	@Autowired
	private TicketService ticketService;
	
	/**
	 * 환불 신청 목록 전체 보기 : 관리자용
	 *  - 전체 리스트 페이징 처리
	 * */
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam(defaultValue = "0") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage, 5, Direction.DESC, "refundCode");
		Page<Refund> rfList = refundService.selectAll(pageable);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("refund/listAdmin");
		mv.addObject("rfList", rfList);
		mv.addObject("previous", pageable.previousOrFirst().getPageNumber());
		mv.addObject("next", pageable.next().getPageNumber());
		return mv;
	}
	
	/**
	 * 회원 id로 환불 신청 내역 검색하기 : 로그인한 사용자용
	 *  - 회원 id로 검색하여 사용자 마이페이지에서 출력
	 *  - 검색 결과 페이징 처리
	 * */
	@RequestMapping("/mylist")
	public ModelAndView myList(HttpServletRequest request, @RequestParam(defaultValue = "0") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage, 5, Direction.DESC, "refundCode");
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Page<Refund> rfList = refundService.searchById(member.getId(), pageable);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("refund/listUser");
		mv.addObject("rfList", rfList);
		mv.addObject("previous", pageable.previousOrFirst().getPageNumber());
		mv.addObject("next", pageable.next().getPageNumber());
		return mv;
	}
	
	/**
	 * 환불 신청 폼으로
	 * */
	@RequestMapping("/refundApp/{ticketCode}")
	public ModelAndView refundApp(HttpServletRequest request, @PathVariable Long ticketCode) {
		Ticket ticket = ticketService.selectByCode(ticketCode);
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("refund/refundApp");
		mv.addObject("ticket", ticket);
		mv.addObject("member", member);
		
		return mv;
	}
	
	/**
	 * 환불 신청 완료하기
	 * */
	@RequestMapping("/request")
	public String refundRequest(String refundReason, Long ticketCode) {
		Refund refund = new Refund();
		Ticket ticket = ticketService.selectByCode(ticketCode);
		refund.setRefundReason(refundReason);
		refund.setRefundState(0);
		refund.setTicket(ticket);
		
		refundService.insert(refund);
		
		return "redirect:refund/list";
	}
	
	/**
	 * 환불 신청 내역 상세보기
	 * */
	@RequestMapping("/read/{code}")
	public ModelAndView refundDetail(@PathVariable Long code) {
		Refund refund = refundService.selectByCode(code);
		Ticket ticket = refund.getTicket();
		Counselor counselor = ticket.getCounselor();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("refund/refundDetail");
		mv.addObject("counselor", counselor);
		mv.addObject("refund", refund);
		mv.addObject("ticket", ticket);
		
		return mv;
	}
	
	/**
	 * 상담권 코드로 환불 진행 상태 검색하기
	 * */
	@RequestMapping("/state/{ticketCode}")
	public int refundState(@PathVariable Long ticketCode) {
		int state = refundService.selectByTicketCode(ticketCode);
		return state;
	}
	
	/**
	 * 환불 처리하기
	 *  1. 상담권 잔여량이 남아있을 때만 환불 가능.
	 *  2. 상담권 잔여량이 남아있을 경우 잔여량을 0으로 만든다.
	 *  3. 환불 불가 결정 or 환불 완료시 신청 내역의 진행 상태를 변경한다.
	 * */
	@RequestMapping("/process/{code}")
	public String refundProcess(@PathVariable Long code) {
		Refund refund = refundService.selectByCode(code);
		refundService.refundTicket(refund);
		return "redirect:/refund/list";
	}
	
	/**
	 * 환불 신청 내역 삭제하기
	 * */
	@RequestMapping("/delete/{code}")
	public String deleteRefundReq(@PathVariable Long code) {
		refundService.delete(code);
		return "redirect:/refund/list";
	}
	
}
