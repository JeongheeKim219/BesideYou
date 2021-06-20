package bu.mvc.service;

import java.util.List;

import bu.mvc.domain.Price;

public interface PriceService {

		/**
		 * 상담사 회원정보 보기
		 * */
	
	List<Price> selectByCounselor(Long counselorCode);
}
