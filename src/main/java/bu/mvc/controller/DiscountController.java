package bu.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bu.mvc.domain.Discount;
import bu.mvc.service.DiscountService;

@Controller
@RequestMapping("/discount")
public class DiscountController {

	@Autowired
	private DiscountService discountService;
	
	/**
	 * 할인 코드에 해당하는 할인율 찾기
	 * */
	public Discount findRate(Long code) {
		return discountService.selectByCode(code);
	}
	
	/**
	 * 원래가격과 할인율 정보로 할인된 가격 산출하기
	 * */
	public int dcPrice(int price, Long code) {
		return discountService.dcPrice(price, code);
	}
	
}
