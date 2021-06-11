package bu.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import bu.mvc.domain.Discount;
import bu.mvc.respsitory.DiscountRepository;

@Service
@Transactional
public class DiscountServiceImpl implements DiscountService {

	private DiscountRepository dcRepository;
	
	@Override
	public List<Discount> selectAll() {
		return dcRepository.findAll();
	}

	@Override
	public void insert(Discount dc) {
		dcRepository.save(dc);
	}

	@Override
	public void update(Discount dc) {
		Discount discount = dcRepository.findById(dc.getDiscountCode()).orElse(null);
		if(discount==null) {
			throw new RuntimeException("할인율 정보가 존재하지 않습니다.");
		}
		discount.setDiscountRate(dc.getDiscountRate());
	}

	@Override
	public void delete(Long dcCode) {
		dcRepository.deleteById(dcCode);
	}

}
