package bu.mvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
public class PaymentController {

	private final CounselService counselService;
	private final DiscountService discountService;
	
	/**
	 * 신용/체크카드 결제 API 연결
	 * */
	@RequestMapping("/payment/inicis")
	public void inicis(HttpServletRequest request, Long counselorCode, Long discountCode, Ticket ticket) {
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		String ticketType = null;
		if(ticket.getTicketField()==0) {
			ticketType = "BesideU 대면상담권";
		}else if(ticket.getTicketField()==1) {
			ticketType = "BesideU 전화상담권";
		}else if(ticket.getTicketField()==2) {
			ticketType = "BesideU 채팅상담권";
		}else if(ticket.getTicketField()==3) {
			ticketType = "BesideU 간편텍스트상담권";
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("name", member.getName());
		mv.addObject("phone", member.getPhone());
		mv.addObject("email", member.getEmail());
		mv.addObject("addr", member.getMemberAddr());
		mv.addObject("ticketType", ticketType);
		mv.addObject("ticketField", ticket.getTicketField());
		mv.addObject("counselorCode", counselorCode);
		mv.addObject("ticketAmount", ticket.getTicketAmount());
		mv.addObject("ticketRemain", ticket.getTicketRemain());
		mv.addObject("discountCode", discountCode);
		mv.addObject("ticketPrice", ticket.getTicketPrice());
		
	}
	
	/**
	 * 휴대폰 결제 API 연결
	 * */
	@RequestMapping("/payment/danal")
	public void danal() {}
	
	/**
	 * PayPal 결제 API 연결
	 * */
	@RequestMapping("/payment/paypal")
	public void paypal() {}
	
	/**
	 * 그림 심리 검사 결제 페이지로 이동
	 * */
	@RequestMapping("/psyPayment/artTestApp")
	public void artTestPay() {}
	
	/**
	 * 신용/체크카드 결제 API 연결(그림 심리 검사)
	 * */
	@RequestMapping("/psyPayment/inicis")
	public void artTestInicis() {}
	
	/**
	 * 휴대폰 결제 API 연결(그림 심리 검사)
	 * */
	@RequestMapping("/psyPayment/danal")
	public void artTestDanal() {}
	
	/**
	 * PayPal 결제 API 연결(그림 심리 검사)
	 * */
	@RequestMapping("/psyPayment/paypal")
	public void artTestPaypal() {}
	
	/**
	 * 결제 성공 페이지로 이동(텍스트, 전화, 대면 상담)
	 * */
	@RequestMapping("/payment/success")
	public void success() {}
	
	/**
	 * 결제 성공 페이지로 이동(그림 심리 검사)
	 * */
	@RequestMapping("/psyPayment/success")
	public void artTestPaySuccess() {}
	
	/**
	 * 결제 실패 페이지로 이동(텍스트, 전화, 대면 상담)
	 * */
	@RequestMapping("/payment/fail")
	public void fail() {}
	
	/**
	 * 결제 실패 페이지로 이동(그림 심리 검사)
	 * */
	@RequestMapping("/psyPayment/fail")
	public void artTestPayFail() {}
	
	
}
