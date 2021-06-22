package bu.mvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bu.mvc.domain.Counselor;
import bu.mvc.domain.Member;
import bu.mvc.domain.Report;
import bu.mvc.domain.ReviewStar;
import bu.mvc.service.ReportService;
import bu.mvc.service.ReviewService;

@Controller
public class ReportController {
	@Autowired
	private ReportService reportService;
	@Autowired
	private ReviewService rs;
	
	
	/**
	 * 신고 등록
	 * */
	
	
	@RequestMapping("/report/insert")
	public String insert(Report report, HttpServletRequest req) {
		
		ReviewStar reviewStar = new ReviewStar();
		Member member = new Member();
		
		member.setMemberCode(Long.parseLong(req.getParameter("memberCode")));
		report.setMember(member);
		
		reviewStar.setReviewCode(Long.parseLong(req.getParameter("reviewCode")));
		report.setReviewStar(reviewStar);
		
		//report.setReportOption(req.getParameter("reportOption"));
		
		report.setReviewContent(req.getParameter("reviewContent"));
		reportService.insert(report);
		System.out.println("req.getParameter(\"counselor\")" + req.getParameter("counselor"));
		return "redirect:/counsel/profile?counselorCode="+req.getParameter("counselor");		
	}
	

	
	/**
	 * 신고확인(관리자)
	 * */
	@RequestMapping("/admin/reportView")
	public void selectAll(Model model,  @RequestParam(defaultValue = "0") int nowPage) {
		System.out.println("여이이어ㅕ이어이여");
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "reportCode");
		Page<Report> pageList = reportService.selectAll(pageable);
		System.out.println( pageList.toString());
		model.addAttribute("ReportpageList",pageList);
		System.out.println("asdfsdaf");
	}
	

	/**
	 * 신고된 리뷰 내용보기
	 * */
	@RequestMapping("/admin/reportRead/{reportCode}")
	public ModelAndView selectByReviewNum(@PathVariable Long reportCode) {
		System.out.println("reviewCode" + reportCode);
		Report report = reportService.selectbyId(reportCode);
		System.out.println(report.getReportCode());
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/reportRead");
		mv.addObject("report",report);
		return mv;
	}
	

	
	/**
	 * 신고 삭제(리뷰같이 삭제)
	 * */
	@RequestMapping("/report/delete" )
	public String deleteAdmin( Report report) {	
		
		Long a =report.getReportCode();
		ReviewStar rsn =report.getReviewStar();
		System.out.println(a);

		reportService.deleteReport(a);
		rs.delete(rsn.getReviewCode());
		System.out.println("완료");
		return "redirect:/admin/reportView";
	}
	
	
	/**
	 * 신고삭제(신고만 삭제)
	 * */
	
	@RequestMapping("/report/deleteReportOnly")
	public String deleteReport( Report report) {
		System.out.println(report.getReportCode());
		Long a = report.getReportCode();
		reportService.deleteReport(a);
		System.out.println("완료");
		return "redirect:/admin/reportView";
	}
	
	
}
