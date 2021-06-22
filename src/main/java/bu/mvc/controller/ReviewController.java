package bu.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.internal.build.AllowSysOut;
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
import bu.mvc.domain.Member;
import bu.mvc.domain.ReviewStar;
import bu.mvc.service.ReviewService;

@Controller

public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	/**
	 * 리뷰폼
	 * */
//	@RequestMapping("/review/reviewForm")
//	public void reviewForm() {
//		
//	}
	
	/**
	 * 리뷰 등록
	 * */
	@RequestMapping("/review/insert")
	public String insert(ReviewStar reviewStar) {
		
		Counselor a = reviewStar.getCounselor();
		Long b= a.getCounselorCode();
		System.out.println(b);
		reviewService.insert(reviewStar);
		String s = "redirect:/counsel/myCounselList?field=-1";
		
		return s;
	}
	
	
	
	
	/**
	 * 모든 리뷰출력(삭제예정)
	 * */
	@RequestMapping("/review/reviewForm")
	public void selectAll(Model model, @RequestParam(defaultValue = "0") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage, 100, Direction.DESC, "reviewCode");
		Page<ReviewStar> pageList = reviewService.selectAll(pageable);
		System.out.println("aaaa  : "+pageList.toString());
		model.addAttribute("pageList", pageList);
	}
	
	/**
	 * 리뷰 입력 테스트용 리스트 출력
	 * */
	
	@RequestMapping("/review/reviewForm/{counselorCode}")
	public ModelAndView selectByCounselor(@PathVariable Long counselorCode) {
		List<ReviewStar> revList = reviewService.selectByCounselorCode(counselorCode, null);
		Double point = reviewService.avgStar(counselorCode);
		System.out.println(point);
		ModelAndView mv = new ModelAndView();
		mv.addObject("revList", revList);
		mv.addObject("avgStar", point);
		mv.setViewName("review/reviewForm");
		return mv;
	}
	
	/**
	 * 상담사 코드에따른 리뷰 출력
	 * */
	
		@RequestMapping("/review/reviewByCode")
		public ModelAndView selectByCounselor(@PathVariable Long counselorCode, @PageableDefault(size = 5, sort = "reviewCode", direction = Sort.Direction.DESC) Pageable pageable) {
			System.out.println("aa");
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

		public String updateReview(ReviewStar review, HttpServletRequest req) {//reviewContent, String reviewContent22
			
			Member member = new Member();
			
			member.setMemberCode(Long.parseLong(req.getParameter("memberCode")));
			review.setMember(member);
			
			review.setReviewCode(Long.parseLong(req.getParameter("reviewCode")));
			review.setReviewContent(req.getParameter("reviewContent"));
			System.out.println(req.getParameter("star"));
			review.setStar(Double.parseDouble(req.getParameter("star")));

			
			//String content = review.getReviewContent();
			
//			review.setReviewContent(reviewContent22);
			
			//System.out.println("content : "+ content);
			//System.out.println("reviewContent22 :: "+ reviewContent22);
			
//			Counselor cs = review.getCounselor();
//			Long cscode = cs.getCounselorCode();
			
			reviewService.update(review);
			return "";

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
