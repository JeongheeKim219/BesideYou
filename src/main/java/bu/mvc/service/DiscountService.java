package bu.mvc.service;

import java.util.List;

import bu.mvc.domain.Discount;

public interface DiscountService {

	/**
	 * 할인율 전체 보기
	 * */
	List<Discount> selectAll();
	
	/**
	 * 할인율 추가하기
	 * */
	void insert(Discount dc);
	
	/**
	 * 할인율 수정하기
	 * */
	void update(Discount dc);
	
	/**
	 * 할인율 삭제하기
	 * */
	void delete(Long dcCode);
	
}
