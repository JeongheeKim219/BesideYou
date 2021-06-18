package bu.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import bu.mvc.domain.Counselor;
import bu.mvc.domain.ReviewStar;

public interface ReviewService {
	
	/**
	 * 리뷰등록
	 * */
	void insert(ReviewStar reviewStar);
	
	/**
	 * 전체리뷰 출력
	 * */
	Page<ReviewStar> selectAll(Pageable pageable);
	
	/**
	 * 상담사 번호에 따른 리뷰 출력
	 * */
	List<ReviewStar> selectByCounselorCode(Long counselor, Pageable pageable);
	
	/**
	 * 상담사별 별점 출력
	 * */
	Double avgStar(Long counselor);

}
