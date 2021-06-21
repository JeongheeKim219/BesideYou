package bu.mvc.service;


import java.util.List;

import bu.mvc.domain.Price;

public interface PriceService {

		/**
		 * 상담사 회원정보 보기
		 * */
	
	List<Price> selectByCounselor(Long counselorCode);


	/**
	 * 상담사 코드와 상담필드로 상담권 가격 정보 찾아오기 - 김동현이 작성함
	 * */
	int findPrice(Long counselorCode, int counselorField);

}
