package bu.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

<<<<<<< HEAD
import bu.mvc.domain.ReviewStar;

public interface ReviewService {
	/**
	 * 리뷰 등록
=======
import bu.mvc.domain.Counselor;
import bu.mvc.domain.ReviewStar;

public interface ReviewService {
	
	/**
	 * 리뷰등록
>>>>>>> gihun
	 * */
	void insert(ReviewStar reviewStar);
	
	/**
<<<<<<< HEAD
	 * 리뷰 출력
=======
	 * 전체리뷰 출력
>>>>>>> gihun
	 * */
	Page<ReviewStar> selectAll(Pageable pageable);
	
	/**
<<<<<<< HEAD
	 * 상담사에 따른 리뷰 출력
	 * */
	List<ReviewStar> selectByCounCode(Long counselorCode, Pageable pageable);
=======
	 * 상담사 번호에 따른 리뷰 출력
	 * */
	List<ReviewStar> selectByCounselorCode(Long counselor, Pageable pageable);
>>>>>>> gihun
	
	/**
	 * 상담사별 별점 출력
	 * */
<<<<<<< HEAD
	Double avgStar(Long counselorCode);
	
	/**
	 * 리뷰 코드별 검색
	 * */
	ReviewStar selectByReviewNo(Long reviewCode);
	
	
}
=======
	Double avgStar(Long counselor);
	
	ReviewStar selectByReviewCode(Long reviewCode);
	
	/**
	 * 리뷰삭제
	 * */
	void delete(Long reviewCode);
	
	/**
	 * 리뷰 수정
	 * */
	ReviewStar update(ReviewStar review);
	
}

>>>>>>> gihun
