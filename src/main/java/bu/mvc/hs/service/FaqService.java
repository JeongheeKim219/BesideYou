package bu.mvc.hs.service;

import java.util.List;

import bu.mvc.domain.Faq;

public interface FaqService {
	
	/**
	 * FAQ전체보기
	 * */
	List<Faq> selectAll();
	
	/**
	 * 주문,결제 FAQ 보기
	 * */
	List<Faq> selectOne();
	
	/**
	 * 상담기록 FAQ 보기
	 * */
	List<Faq> selectTwo();
	
	/**
	 * 상담사문의 FAQ 보기
	 * */
	List<Faq> selectThree();
	
	/**
	 * 로그인 FAQ 보기
	 * */
	List<Faq> selectFour();
	
	/**
	 * 서비스문의 FAQ 보기
	 * */
	List<Faq> selectFive();
	
	/**
	 * 기타 FAQ 보기
	 * */
	List<Faq> selectSix();
	
	/**
	 * FAQ 등록하기
	 * */
	void insert(Faq faq);
	
	/**
	 * FAQ 상세보기
	 * */
	Faq selectById(Long faqCode);
	
	/**
	 * FAQ 삭제하기
	 * */
	void delete(Long faqCode);
	
	/**
	 * FAQ 수정하기
	 * */
	Faq update(Faq faq);

}










