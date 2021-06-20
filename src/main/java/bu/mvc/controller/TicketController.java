package bu.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import bu.mvc.domain.Discount;
import bu.mvc.domain.Member;
import bu.mvc.domain.Ticket;
import bu.mvc.service.CounselService;
import bu.mvc.service.DiscountService;
import bu.mvc.service.PriceService;
import bu.mvc.service.RefundService;
import bu.mvc.service.TicketService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/ticket")
public class TicketController {

	private final TicketService ticketService;
	private final RefundService refundService;
	private final CounselService counselService;
	private final DiscountService discountService;
	private final PriceService priceService;
	
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
		mv.setViewName("ticket/ticketDetail");
		mv.addObject("counselor", counselor);
		mv.addObject("ticket", ticket);
		mv.addObject("refundState", refundState);
		
		return mv;
	}
	
	/**
	 * 상담권 구매 폼으로
	 * */
	@RequestMapping("/ticketApp")
	public ModelAndView paymentApp(HttpServletRequest request, Long counselorCode, int counselCategory) {
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int price = priceService.findPrice(counselorCode, counselCategory);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ticket/ticketApp");
		mv.addObject("counselorCode", counselorCode);
		mv.addObject("member", member);
		mv.addObject("counselCategory", counselCategory);
		mv.addObject("price", price);
		
		return mv;
	}
	
	/**
	 * 상담권 구매 완료 (결제 성공시)
	 * */
	@RequestMapping("/buy")
	public ModelAndView buyTicket(HttpServletRequest request, HttpSession session) {
		
		int ticketField = (int)session.getAttribute("ticketField");
		Long counselorCode = (Long)session.getAttribute("counselorCode");
		int ticketAmount = (int)session.getAttribute("ticketAmount");
		int ticketRemain = (int)session.getAttribute("ticketRemain");
		Long discountCode = (Long)session.getAttribute("discountCode");
		int ticketPrice = (int)session.getAttribute("ticketPrice");
		
		Counselor counselor = counselService.getCounselor(counselorCode);
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Discount discount = discountService.selectByCode(discountCode);
		
		Ticket ticket = new Ticket();
		ticket.setTicketField(ticketField);
		ticket.setCounselor(counselor);
		ticket.setMember(member);
		ticket.setTicketAmount(ticketAmount);
		ticket.setTicketRemain(ticketRemain);
		ticket.setDiscount(discount);
		ticket.setTicketPrice(ticketPrice);
		
		ticketService.insert(ticket);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("counsel/apply012");
		mv.addObject("counselorCode", counselor.getCounselorCode());
		mv.addObject("couselCategory", ticketField);
		
		return mv;
	}
	
	/**
	 * 상담권 사용하기
	 * */
	@RequestMapping("/use/{code}")
	public String useTicket(@PathVariable Long code) {
		ticketService.useTicket(code);
		return "redirect:/ticket/read/"+code;
	}
	
	/**
	 * 소진된 상담권 삭제하기
	 * */
	@RequestMapping("/delete/{code}")
	public String deleteTicket(@PathVariable Long code) {
		ticketService.delete(code);
		return "redirect:/ticket/read/"+code;
	}
	
}
