package bu.mvc.service;


import java.util.List;

import javax.transaction.Transactional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bu.mvc.domain.Price;
import bu.mvc.respsitory.PriceRepository;

@Service
@Transactional
public class PriceServiceImpl implements PriceService {

	@Autowired
	private PriceRepository priceRap;
	@Override
	public List<Price> selectByCounselor(Long counselorCode) {
		
		return priceRap.searchByCode(counselorCode);
	}

	
	/**
	 * 상담사 코드와 상담필드로 상담권 가격 정보 찾아오기 - 김동현이 작성함
	 * */
	@Override
	public int findPrice(Long counselorCode, int counselorField) {
		Price dbPrice = priceRap.findByCounselorCounselorCodeAndCounselorField(counselorCode, counselorField);
		if(dbPrice==null) throw new RuntimeException("해당 상담사의 가격 정보가 존재하지 않습니다.");
		int price = dbPrice.getCounselorPrice();
		return price;

	}

}
