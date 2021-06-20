package bu.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import bu.mvc.domain.ReviewStar;

public interface ReviewService {
	/**
	 * 리뷰 등록
	 * */
	void insert(ReviewStar reviewStar);
	
	/**
	 * 리뷰 출력
	 * */
	Page<ReviewStar> selectAll(Pageable pageable);
	
	/**
	 * 상담사에 따른 리뷰 출력
	 * */
	List<ReviewStar> selectByCounCode(Long counselorCode, Pageable pageable);
	
	/**
	 * 상담사별 별점 출력
	 * */
	Double avgStar(Long counselorCode);
	
	/**
	 * 리뷰 코드별 검색
	 * */
	ReviewStar selectByReviewNo(Long reviewCode);
	
	
}
