package bu.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import bu.mvc.domain.Counselor;
import bu.mvc.domain.ReviewStar;
import bu.mvc.respsitory.ReviewRepository;

@Service
@Transactional
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewRepository reviewRepository; 
	
	
	@Override
	public void insert(ReviewStar reviewStar) {
		reviewRepository.save(reviewStar);
	}

	@Override
	public Page<ReviewStar> selectAll(Pageable pageable) {
		return reviewRepository.findAll(pageable);
	}

	@Override
	public List<ReviewStar> selectByCounselorCode(Long counselor, Pageable pageable) {
		List<ReviewStar> reviewList = reviewRepository.selectByCounCode(counselor, pageable);
		return reviewList;
	}

	@Override
	public Double avgStar(Long counselorCode) {
		Double point = reviewRepository.selectStarAvg(counselorCode);
		point = (point == null)? 0.0 : point;
		return point;
	}

	@Override
	public ReviewStar selectByReviewCode(Long reviewCode) {
		
		return reviewRepository.findById(reviewCode).orElse(null);
	}

	@Override
	public void delete(Long reviewCode) {
		reviewRepository.deleteById(reviewCode);
		
	}

	@Override
	public ReviewStar update(ReviewStar review) {
		ReviewStar reviewUpdate = reviewRepository.findById(review.getReviewCode()).orElse(null);
		reviewUpdate.setStar(review.getStar());
		reviewUpdate.setReviewContent(review.getReviewContent());
		System.out.println("서비스콜" + review.getReviewContent());
		return reviewUpdate;
	}

}
