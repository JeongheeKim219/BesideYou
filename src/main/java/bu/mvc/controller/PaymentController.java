package bu.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaymentController {

	/**
	 * 신용/체크카드 결제 API 연결
	 * */
	@RequestMapping("/payment/inicis")
	public void inicis() {}
	
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
