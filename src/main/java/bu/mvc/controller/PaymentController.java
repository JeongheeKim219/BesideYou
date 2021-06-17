package bu.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/payment")
public class PaymentController {

	/**
	 * 결제 페이지로 이동(그림 심리 검사)
	 * */
	@RequestMapping("/artTestApp")
	public void artTestApp() {}
	
	/**
	 * 신용/체크카드 결제 API 연결
	 * */
	@RequestMapping("/inicis")
	public void inicis() {}
	
	/**
	 * 휴대폰 결제 API 연결
	 * */
	@RequestMapping("/danal")
	public void danal() {}
	
	/**
	 * PayPal 결제 API 연결
	 * */
	@RequestMapping("/paypal")
	public void paypal() {}
	
	/**
	 * 결제 성공 페이지로 이동(텍스트, 전화, 대면 상담)
	 * */
	@RequestMapping("/success")
	public void success() {}
	
	/**
	 * 결제 성공 페이지로 이동(그림 심리 검사)
	 * */
	@RequestMapping("/testPaySuccess")
	public String testPaySuccess() {
		return "redirect:psy/art";
	}
	
	/**
	 * 결제 실패 페이지로 이동
	 * */
	@RequestMapping("/fail")
	public void fail() {}
	
}
