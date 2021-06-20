package bu.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bu.mvc.domain.Price;
import bu.mvc.respsitory.PriceRepository;

@Service
public class PriceServiceImpl implements PriceService {

	@Autowired
	private PriceRepository priceRepository;
	
	/**
	 * 상담사 코드와 상담필드로 상담권 가격 정보 찾아오기 - 김동현이 작성함
	 * */
	@Override
	public int findPrice(Long counselorCode, int counselorField) {
		Price dbPrice = priceRepository.findByCounselorCounselorCodeAndCounselorField(counselorCode, counselorField);
		if(dbPrice==null) throw new RuntimeException("해당 상담사의 가격 정보가 존재하지 않습니다.");
		int price = dbPrice.getCounselorPrice();
		return price;
	}

}
