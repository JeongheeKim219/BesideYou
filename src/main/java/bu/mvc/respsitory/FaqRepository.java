package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.Faq;

public interface FaqRepository extends JpaRepository<Faq, Long> {
	
	/**
	 * 주문,결제 FAQ 보기
	 * */
	@Query("select f from Faq f where f.faqCategory = 0 order by f.faqCode asc")
	List<Faq> selectOne();
	
	/**
	 * 상담기록 FAQ 보기
	 * */
	@Query("select f from Faq f where f.faqCategory = 1 order by f.faqCode asc")
	List<Faq> selectTwo();
	
	/**
	 * 상담사문의 FAQ 보기
	 * */
	@Query("select f from Faq f where f.faqCategory = 2 order by f.faqCode asc")
	List<Faq> selectThree();
	
	/**
	 * 로그인 FAQ 보기
	 * */
	@Query("select f from Faq f where f.faqCategory = 3 order by f.faqCode asc")
	List<Faq> selectFour();
	
	/**
	 * 서비스문의 FAQ 보기
	 * */
	@Query("select f from Faq f where f.faqCategory = 4 order by f.faqCode asc")
	List<Faq> selectFive();
	
	/**
	 * 기타 FAQ 보기
	 * */
	@Query("select f from Faq f where f.faqCategory = 5 order by f.faqCode asc")
	List<Faq> selectSix();

}
























