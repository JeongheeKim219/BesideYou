package bu.mvc.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bu.mvc.domain.Counsel;
import bu.mvc.domain.Counselor;
import bu.mvc.domain.Member;
import bu.mvc.service.CounselService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/counsel")
public class CounselController {

	private final CounselService counselService;

	@RequestMapping("/apply012")
	public ModelAndView apply012(HttpServletRequest request) {
		// 보낼 정보 : 상담사객체, 상담유형, 잔여 상담권 개수
		
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Counselor counselor = counselService.getCounselor(26L);
		int counselField = 1;

		ModelAndView mv = new ModelAndView();
		if (counselField == 0 || counselField == 1 || counselField == 2) {
			mv.setViewName("/counsel/apply012");
		} else {
			mv.setViewName("/counsel/apply3");
		}
		
		int remainTicket = counselService.getRemainTicket(counselor.getCounselorCode(), member.getMemberCode(), counselField);
		
		mv.addObject("counselField", counselField);
		mv.addObject("counselor", counselor);
		mv.addObject("remainTicket", remainTicket);
		return mv;
	}
	
	@RequestMapping("/submit012")
	public ModelAndView submit012(HttpServletRequest request, String counselTime, String counselDate, Long counselorCode, int counselCategory) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/counsel/result");
		LocalDateTime dateTime = LocalDateTime.parse(counselDate+" "+counselTime, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		System.out.println("counseldateTime : "+dateTime);
		System.out.println("counselorCode : "+ counselorCode);
		System.out.println("counselCategory : "+ counselCategory);
		System.out.println("memberCode : " +member.getMemberCode());
		
		counselService.submit012(new Counsel(null, member, new Counselor(counselorCode), counselCategory, 1, dateTime));
		
		mv.addObject("message", "상담신청이 완료되었습니다.");
		return mv;
	}
}
