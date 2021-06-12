package bu.mvc.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bu.mvc.domain.Discount;
import bu.mvc.respsitory.DiscountRepository;

@Service
@Transactional
public class DiscountServiceImpl implements DiscountService {

	@Autowired
	private DiscountRepository dcRepository;

	//할인가 산출
	@Override
	public int dcPrice(int prePrice, Long dcCode) {
		int dcRate = this.selectByCode(dcCode).getDiscountRate();
		int dcPrice = prePrice * dcRate / 100;
		return dcPrice;
	}
	
	@Override
	public Discount selectByCode(Long dcCode) {
		Discount discount = dcRepository.findById(dcCode).orElse(null);
		if(discount==null) {
			throw new RuntimeException("할인율 정보가 존재하지 않습니다.");
		}
		return discount;
	}

}
