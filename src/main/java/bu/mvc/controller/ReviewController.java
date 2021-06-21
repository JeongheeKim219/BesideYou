package bu.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bu.mvc.domain.Counselor;
import bu.mvc.domain.ReviewStar;
import bu.mvc.service.ReviewService;

@Controller

public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	

	/**
	 * 리뷰 등록
	 * */
	@RequestMapping("/review/insert")
	public String insert(ReviewStar reviewStar) {
		System.out.println(reviewStar.toString());
		System.out.println(reviewStar.getMember().toString());
		Counselor a = reviewStar.getCounselor();
		Long b= a.getCounselorCode();
		System.out.println(b);
		reviewService.insert(reviewStar);
		
		return "redirect:/counsel/myCounselList?field=-1";
	}
	



	
	
	/**
	 * 리뷰코드에 해당하는 리뷰 수정
	 * */
		@RequestMapping("/review/reviewUpdate")
		public String updateReview(ReviewStar review , String reviewContent22) {//reviewContent
			
			String content = review.getReviewContent();
			
			review.setReviewContent(reviewContent22);
			
			System.out.println("content :: "+ content);
			System.out.println("reviewContent22 :: "+ reviewContent22);
			
			Counselor cs = review.getCounselor();
			Long cscode = cs.getCounselorCode();
			
			reviewService.update(review);
			return "redirect:/counsel/profile?counselorCode="+cscode;
		}

	/**
	 * 리뷰 삭제
	 * */
	
	@RequestMapping("/review/reviewDelete")
	public String deleteReview( ReviewStar review) {
		System.out.println("넘어오냐? : " + review.getReviewCode());
		Long rc = review.getReviewCode();
		Counselor cs = review.getCounselor();
		Long cscode = cs.getCounselorCode();
		System.out.println(cscode);
		reviewService.delete(rc);
		
		return "redirect:/counsel/profile?counselorCode="+cscode;
	}
	

	

}
