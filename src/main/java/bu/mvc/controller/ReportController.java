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
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "reportCode");
		Page<Report> pageList = reportService.selectAll(pageable);
		System.out.println(pageList.toString());
		model.addAttribute("ReportpageList",pageList);
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
	 * 신고 삭제
	 * */
	@ResponseBody
	@RequestMapping("/report/delete")
	public String deleteAdmin(@RequestBody ReportDTO report) {
		Long a =Long.parseLong(report.getReportCode());
		Long b =Long.parseLong (report.getReviewCode());
		System.out.println(a +"///" + b);
		reportService.deleteReport(a);
		rs.delete(b);
		System.out.println("완료");
		return "redirect:/review/reviewList";
	}
	
	
}
