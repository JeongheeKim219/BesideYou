package bu.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

<<<<<<< HEAD
=======
import bu.mvc.domain.Counselor;
>>>>>>> gihun
import bu.mvc.domain.ReviewStar;
import bu.mvc.respsitory.ReviewRepository;

@Service
@Transactional
<<<<<<< HEAD
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewRepository reviewRepository;
	
	@Override
	public void insert(ReviewStar reviewStar) {
		
		reviewRepository.save(reviewStar);
		
=======
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewRepository reviewRepository; 
	
	
	@Override
	public void insert(ReviewStar reviewStar) {
		reviewRepository.save(reviewStar);
>>>>>>> gihun
	}

	@Override
	public Page<ReviewStar> selectAll(Pageable pageable) {
<<<<<<< HEAD
		
=======
>>>>>>> gihun
		return reviewRepository.findAll(pageable);
	}

	@Override
<<<<<<< HEAD
	public List<ReviewStar> selectByCounCode(Long counselorCode, Pageable pageable) {
		List<ReviewStar> reviewList = reviewRepository.selectByCounCode(counselorCode, pageable);
=======
	public List<ReviewStar> selectByCounselorCode(Long counselor, Pageable pageable) {
		List<ReviewStar> reviewList = reviewRepository.selectByCounCode(counselor, pageable);
>>>>>>> gihun
		return reviewList;
	}

	@Override
	public Double avgStar(Long counselorCode) {
		Double point = reviewRepository.selectStarAvg(counselorCode);
		point = (point == null)? 0.0 : point;
		return point;
	}

	@Override
<<<<<<< HEAD
	public ReviewStar selectByReviewNo(Long reviewCode) {
		return reviewRepository.findById(reviewCode).orElse(null);
	}





	
=======
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

>>>>>>> gihun
}
