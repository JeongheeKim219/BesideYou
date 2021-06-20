package bu.mvc.service;

import bu.mvc.domain.Discount;

public interface DiscountService {

	/**
	 * 할인되는 가격 산출하기(ajax 이용)
	 * */
	int dcPrice(int prePrice, Long dcCode);
	
	/**
	 * 코드에 해당하는 할인율 찾기
	 *  - 1번코드 : 할인율 없음
	 *  - 2 ~ 30번은 코드번호와 같은 퍼센테이지로 할인 (예: 25번 코드 할인율은 25퍼센트)
	 *  - 31번:50, 32번:70, 33번:90
	 * */
	Discount selectByCode(Long dcCode);
	
}
