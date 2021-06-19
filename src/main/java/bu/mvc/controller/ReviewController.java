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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bu.mvc.domain.Counselor;
import bu.mvc.domain.Report;
import bu.mvc.domain.ReviewStar;
import bu.mvc.service.ReviewService;

@Controller

public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	/**
	 * 리뷰폼
	 * */
	@RequestMapping("/review/reviewForm")
	public void reviewForm() {
		
	}
	
	/**
	 * 리뷰 등록
	 * */
	@RequestMapping("/review/insert")
	public String insert(ReviewStar reviewStar) {
		System.out.println(reviewStar.getMember());
		reviewService.insert(reviewStar);
		
		return "redirect:/review/reviewList";
	}
	
	
	
	
	/**
	 * 모든 리뷰출력(삭제예정)
	 * */
	@RequestMapping("/review/reviewList")
	public void selectAll(Model model, @RequestParam(defaultValue = "0") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage, 100, Direction.DESC, "reviewCode");
		Page<ReviewStar> pageList = reviewService.selectAll(pageable);
		System.out.println("aaaa  : "+pageList.toString());
		model.addAttribute("pageList", pageList);
	}
	
	/**
	 * 상담사 코드에따른 리뷰 출력
	 * */
	@RequestMapping("/review/reviewByCode/{counselorCode}")
	public ModelAndView selectByCounselor(@PathVariable Long counselorCode, @PageableDefault(size = 5, sort = "reviewCode", direction = Sort.Direction.DESC) Pageable pageable) {
		List<ReviewStar> revList = reviewService.selectByCounselorCode(counselorCode, pageable);
		Double point = reviewService.avgStar(counselorCode);
		System.out.println(point);
		ModelAndView mv = new ModelAndView();
		mv.addObject("revList", revList);
		mv.addObject("avgStar", point);
		mv.addObject("previous", pageable.previousOrFirst().getClass());
		mv.addObject("next", pageable.next().getPageNumber());
		mv.setViewName("review/reviewByCode");
		return mv;
		
	}
	
	/**
	 * 리뷰코드에 해당하는 리뷰 수정
	 * */
	@RequestMapping("/review/reviewUpdate")
	public ModelAndView updateReview(ReviewStar review,@PageableDefault(size = 5, sort = "reviewCode", direction = Sort.Direction.DESC) Pageable pageable ) {
	
		Counselor cs = review.getCounselor();
		Long cscode = cs.getCounselorCode();
		String content = review.getReviewContent();
		System.out.println(content);
		reviewService.update(review);
		List<ReviewStar> revList = reviewService.selectByCounselorCode(cscode, pageable);
		Double point = reviewService.avgStar(cscode);
		ModelAndView mv = new ModelAndView();
		mv.addObject("revList", revList);
		mv.addObject("avgStar", point);
		mv.addObject("previous", pageable.previousOrFirst().getClass());
		mv.addObject("next", pageable.next().getPageNumber());
		mv.setViewName("review/reviewByCode");
		return mv;
	}
	
	
	/**
	 * 리뷰 삭제
	 * */
	
	@RequestMapping("/review/reviewDelete")
	public ModelAndView deleteReview( ReviewStar review, @PageableDefault(size = 5, sort = "reviewCode", direction = Sort.Direction.DESC) Pageable pageable) {
		System.out.println("넘어오냐? : " + review.getReviewCode());
		Long rc = review.getReviewCode();
		Counselor cs = review.getCounselor();
		Long cscode = cs.getCounselorCode();
		System.out.println(cscode);
		reviewService.delete(rc);
		List<ReviewStar> revList = reviewService.selectByCounselorCode(cscode, pageable);
		Double point = reviewService.avgStar(cscode);
		ModelAndView mv = new ModelAndView();
		mv.addObject("revList", revList);
		mv.addObject("avgStar", point);
		mv.addObject("previous", pageable.previousOrFirst().getClass());
		mv.addObject("next", pageable.next().getPageNumber());
		mv.setViewName("review/reviewByCode");
		
		return mv;
	}
	
	

}
