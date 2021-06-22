package bu.mvc.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bu.mvc.domain.Counsel;
import bu.mvc.domain.Counselor;
import bu.mvc.domain.Member;
import bu.mvc.domain.Requests;
import bu.mvc.domain.Speciality;
import bu.mvc.domain.Tag;
import bu.mvc.service.CounselService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/counsel")
public class CounselController {

	private final CounselService counselService;

	@Autowired
	private ReviewService reviewService;

	/**
	 * 신청 폼 이동 (* 연결할 때 input param 필요
	 * */
	@RequestMapping("/apply")
	public ModelAndView apply(HttpServletRequest request, Long counselorCode, int counselCategory) {
		// 보낼 정보 : 상담사객체, 상담유형, 잔여 상담권 개수
		
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Counselor counselor = counselService.getCounselor(counselorCode);
		int counselField = counselCategory;

		ModelAndView mv = new ModelAndView();
		if (counselField == 0 || counselField == 1 || counselField == 2) {
			mv.setViewName("/counsel/apply012");
		} else {
			mv.setViewName("/counsel/apply3");
		}
		
		String tomorrow = LocalDate.now().plusDays(1).toString();
		int remainTicket = counselService.getRemainTicket(counselor.getCounselorCode(), member.getMemberCode(), counselField);
		
		mv.addObject("counselField", counselField);
		mv.addObject("counselor", counselor);
		mv.addObject("remainTicket", remainTicket);
		mv.addObject("tomorrow", tomorrow);
		
		return mv;
	}
	
	/**
	 * 상담 카테고리가 0, 1, 2 일 때 신청
	 * */
	@RequestMapping("/submit012")
	public ModelAndView submit012(HttpServletRequest request, String counselTime, String counselDate, Long counselorCode, int counselCategory, int remainTicket) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/counsel/result");
		LocalDateTime dateTime = LocalDateTime.parse(counselDate+" "+counselTime, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Counselor counselor = counselService.getCounselor(counselorCode);
		
		//데이터 확인
		System.out.println("counseldateTime : "+dateTime);
		System.out.println("counselorCode : "+ counselorCode);
		System.out.println("counselCategory : "+ counselCategory);
		System.out.println("memberCode : " +member.getMemberCode());
		System.out.println("remainTicket : " + remainTicket);
		
		if(remainTicket<=0) {
			mv.setViewName("/counsel/result");
			mv.addObject("counselor", counselor);
			mv.addObject("counselCategory", counselCategory);
			mv.addObject("message", "결제화면 연결 예정");
			return mv;
		}
		
		counselService.submit012(new Counsel(null, member, new Counselor(counselorCode), counselCategory, 0, dateTime));
		mv.addObject("message", "상담신청이 완료되었습니다.");
		
		return mv;
	}
	
	/**
	 * 상담 카테고리가 3일 때 신청
	 * */
	@RequestMapping(value = "/submit3" , method = RequestMethod.POST)
	public ModelAndView submit3(HttpServletRequest request,  Long counselorCode, int remainTicket, String requestTitle, String requestContent, String requestCategory) {
		System.out.println("in");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/counsel/result");
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Counselor counselor = counselService.getCounselor(counselorCode);
		
		//데이터 확인
		System.out.println("counselorCode : "+ counselorCode);
		System.out.println("requestCategory : "+ requestCategory);
		System.out.println("memberCode : " +member.getMemberCode());
		System.out.println("remainTicket : " + remainTicket);
		
		
		if(remainTicket<=0) {
			mv.setViewName("/counsel/result");
			mv.addObject("counselor", counselor);
			mv.addObject("counselCategory", 3);
			mv.addObject("message", "결제화면 연결 예정");
			return mv;
		}
		
		Requests requests = new Requests();
		requests.setRequestCategory(requestCategory);
		requests.setRequestContent(requestContent);
		requests.setRequestTitle(requestTitle);
		
		counselService.submit3(new Counsel(null, member, counselor, 3, 0, LocalDateTime.now()), requests);
		
		mv.addObject("message", "상담신청이 완료되었습니다.");
		
		return mv;
	}
	
	@RequestMapping("/myCounselList")
	public ModelAndView myCounselList(HttpServletRequest request, int field, @RequestParam(defaultValue = "0") int nowPage) {
		ModelAndView mv = new ModelAndView();
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Pageable pageable = PageRequest.of(nowPage, 5, Direction.DESC, "counselCode");
		
		
		if(field==3) {
			Page<Counsel> pageList3 = counselService.myList3(pageable, member);
			mv.setViewName("/counsel/list3");
			mv.addObject("pageList", pageList3);
			
			return mv;
		}
		
		Page<Counsel> pageList = counselService.myList012(pageable, field, member);
		
		mv.setViewName("/counsel/list012");
		mv.addObject("pageList", pageList);
		mv.addObject("field", field);
		
		return mv;
	}
	
	@RequestMapping("/listForCounselor")
	public ModelAndView listForCounselor(HttpServletRequest request, int field,@RequestParam(defaultValue = "0") int nowPage) {
		ModelAndView mv = new ModelAndView();
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(member.getMemberType()!=1) {
			mv.setViewName("/index");
			return mv;
		}
		
		Pageable pageable = PageRequest.of(nowPage, 5, Direction.DESC, "counselCode");
		Counselor counselor = counselService.checkCounselor(member.getMemberCode());
		
		if(field==3) {
			Page<Counsel> pageList = counselService.counselorList3(pageable, counselor);
			mv.setViewName("/counsel/listCounselor3");
			mv.addObject("pageList", pageList);
			return mv;
		}
		
		Page<Counsel> pageList = counselService.counselorList012(pageable, field, counselor);
		mv.setViewName("/counsel/listCounselor012");
		mv.addObject("pageList", pageList);
		mv.addObject("field", field);
		return mv;
	}
	
	@RequestMapping("/seeDetail")
	public ModelAndView seeDetail(Long counselCode) {
		ModelAndView mv = new ModelAndView();
		Counsel counsel = counselService.seeDeatil(counselCode);
		mv.setViewName("/counsel/detail");
		mv.addObject("counsel", counsel);
		return mv;
	}
	
	@RequestMapping("/approve")
	public String approve(Long counselCode) {
		System.out.println(counselCode+" !!!!in!!!!!!!!!!");
		counselService.approve012(counselCode);
		return "redirect:/counsel/listForCounselor?field=-1";
	}
	
	@RequestMapping("/reject")
	public String reject(Long counselCode) {
		counselService.reject012(counselCode);
		return "redirect:/counsel/listForCounselor?field=-1";
	}
	
	@RequestMapping("/complete")
	public String complete(Long counselCode) {
		counselService.complete(counselCode);
		return "redirect:/counsel/listForCounselor?field=-1";
	}
	
	@RequestMapping("/profile")
	public ModelAndView profile(Long counselorCode) {
		ModelAndView mv = new ModelAndView();
		Counselor counselor = counselService.getCounselor(counselorCode);
		List<Tag> tagList = counselService.getTag(counselor);
		List<Speciality> speList = counselService.getSpecialities(counselor);

		System.out.println("counselorCOde : " + counselorCode);
		List<ReviewStar> review = reviewService.selectByCounselorCode(counselorCode, pageable);
		mv.setViewName("/counsel/profile");
		mv.addObject("counselor", counselor);
		mv.addObject("tagList", tagList);
		mv.addObject("speList", speList);
		mv.addObject("review", review); // 리뷰 리스트 가져오기

		return mv;
	}
	
	@RequestMapping("/counselorList")
	public ModelAndView counselorList(@RequestParam(defaultValue = "0") int nowPage) {
		ModelAndView mv = new ModelAndView();
		
		Pageable pageable = PageRequest.of(nowPage, 6, Direction.DESC, "counselorCode");
		
		
		Page<Counselor> pageList = counselService.counselorList(pageable);
		mv.setViewName("/counsel/counselorList");
		mv.addObject("pageList", pageList);
		return mv;
	}
}
