package bu.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	//@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody
	@RequestMapping("/report/insert")
	public String insert(@RequestBody ReportDTO reportDTO) {
		System.out.println("insertCall...");
		System.out.println("aa : "+reportDTO.getReviewCode());
		System.out.println("a: "+reportDTO.getMemberCode());
		System.out.println("aaaa: "+reportDTO.getReportOption());
		System.out.println("ReviewContent: "+reportDTO.getReviewContent());
		
		
		Report r = new Report();
		Member m = new Member();
		ReviewStar rs = new ReviewStar();
		
		
		
		rs.setReviewCode(Long.parseLong(reportDTO.getReviewCode()));

		r.setReviewStar(rs);
		
		m.setMemberCode(Long.parseLong(reportDTO.getMemberCode()));
		r.setMember(m);
		
		r.setReportOption(reportDTO.getReportOption());
		r.setReviewContent(reportDTO.getReviewContent());
				
		reportService.insert(r);
		return "redirect:/review/reviewByCode/{counselorCode}";
				
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
