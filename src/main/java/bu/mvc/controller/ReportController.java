package bu.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bu.mvc.domain.Member;
import bu.mvc.domain.Report;
import bu.mvc.domain.ReviewStar;
import bu.mvc.service.ReportService;

@Controller

public class ReportController {
	@Autowired
	private ReportService reportService;
	
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
		
		Report r = new Report();
		Member m = new Member();
		ReviewStar rs = new ReviewStar();
		rs.setReviewCode(Long.parseLong(reportDTO.getReviewCode()));
		r.setReviewStar(rs);
		m.setMemberCode(Long.parseLong(reportDTO.getMemberCode()));
		r.setMember(m);
		r.setReportOption(reportDTO.getReportOption());
				
		reportService.insert(r);
		
		return "redirect:/review/reviewByCode/{counselorCode}";
	}
	

}
