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

}
