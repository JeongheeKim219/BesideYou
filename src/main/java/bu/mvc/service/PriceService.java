package bu.mvc.service;

public interface PriceService {

	/**
	 * 상담사 코드와 상담필드로 상담권 가격 정보 찾아오기 - 김동현이 작성함
	 * */
	int findPrice(Long counselorCode, int counselorField);
}
