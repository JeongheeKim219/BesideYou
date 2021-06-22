package bu.mvc.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

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

import bu.mvc.domain.AjaxData;
import bu.mvc.domain.AjaxDataTwo;
import bu.mvc.domain.Contact;
import bu.mvc.domain.ContactReply;
import bu.mvc.domain.Counsel;
import bu.mvc.domain.Counselor;
import bu.mvc.domain.Member;
import bu.mvc.domain.ReviewStar;
import bu.mvc.domain.Ticket;
import bu.mvc.domain.TicketLines;
import bu.mvc.respsitory.CounselorRepository;
import bu.mvc.respsitory.MemberRepository;
import bu.mvc.service.AdminService;
import bu.mvc.service.TicketLinesService;
import bu.mvc.service.TicketService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private MemberRepository memberRep;

	@Autowired
	private CounselorRepository counselorRep;

	@Autowired
	private TicketService ticketService;

	@Autowired
	private TicketLinesService ticketLinesService;
	
	/**
	 * 1. 어드민 인덱스로 이동
	 */
	@RequestMapping("/index")
	public String index(Model model) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String now = formatter.format(date);

		
		
		
		model.addAttribute("now", now);
		model.addAttribute("newRegularCount", selectNewByType(0).size());
		model.addAttribute("newCounselorCount", selectNewByType(1).size());
		model.addAttribute("newCounselCount", countNewCounsel().size());
		model.addAttribute("pendingContactCount", contactByState(0).size());
		model.addAttribute("dayIncome", incomeToday());
		model.addAttribute("stateMap", countCounselByState());
		model.addAttribute("registerStateMap", counselorByState());
		model.addAttribute("monthIncome", selectSalesThisMonth());
		
		return "admin/index";
	}

		
	
	/**
	 * 2. 신규 회원 타입별 가입자 인원수 조회
	 */
	public List<Member> selectNewByType(int memberType) {
		return adminService.selectNewMemberList(memberType);
	}


	/**
	 * 4. 회원 전체 보기 페이지로 이동 1) 전체 회원 조회 2) 페이징
	 */
	@RequestMapping("/memberView")
	public String select(Model model, @RequestParam(defaultValue = "0") int currentPage) {

		Pageable pageable = PageRequest.of(currentPage, 10, Direction.DESC, "memberCode");
		Page<Member> pageList = adminService.selectAll(pageable);
		model.addAttribute("pageList", pageList);
		return "admin/memberView";
	}

	/**
	 * 5. 해당 월 상담상태별 조회
	 */
	public Map<String, List<Counsel>> countCounselByState() {
		return adminService.counselByState();
	}

	/**
	 * 6. 당일 상담권 매출 조회
	 */
	public int incomeToday() {
		return adminService.incomeToday();
	}

	/**
	 * 7. 당일 상담 신청 내역 조회
	 */
	public List<Counsel> countNewCounsel() {
		return adminService.countNewCounsel();
	}

	/**
	 * 8. 상담사 등록 현황 조회
	 */
	public Map<String, List<Counselor>> counselorByState() {
		return adminService.counselorByState();
	}

	/**
	 * 9. 처리 상태별 문의 내역 조회
	 */
	public List<Contact> contactByState(int state) {
		return adminService.contactByState(state);
	}

	/**
	 * 10. (차트)해당일 기준 7일간 가입한 신규 회원 수
	 */
	@ResponseBody
	@RequestMapping(value = "/countNewMember")
	public List<Integer> test(@RequestBody AjaxData ajaxData) {
		return adminService.countMemberJoin2(ajaxData.getWeekList());
	}

	
	
//////////////////////////////////////////수현님 소스////////////////////////////////////////////////////////////////	
	
	/**
	 * 11. 회원 정보 상세보기 페이지로 이동
	 */
	@RequestMapping("/memberDetailView/{memberCode}")
	public String viewMemberDetail(@PathVariable Long memberCode, Model model
			,@RequestParam(defaultValue = "1") int nowTicketPage
			,@RequestParam(defaultValue = "1") int nowTicketLinesPage
			,@RequestParam(defaultValue = "1") int nowReviewPage
			,@RequestParam(defaultValue = "1") int nowCounselPage
			,@RequestParam(defaultValue = "0") int currentPage
			) {
		Member member = adminService.selectMember(memberCode);
		model.addAttribute("member", member);
		
		//멤버코드에 해당하는 결제내역
		Pageable pageableTicket = PageRequest.of((nowTicketPage-1), 7, Direction.DESC, "ticketDate");
		Page<Ticket> ticket = adminService.findByMemberMemberCode(pageableTicket, memberCode);
		int ticketBlock = 5;
		int ticketTemp = (nowTicketPage-1) % ticketBlock;
		int ticketStartPage = nowTicketPage - ticketTemp;
		model.addAttribute("ticket", ticket);
		model.addAttribute("ticketBlock", ticketBlock);
		model.addAttribute("nowTicketPage", nowTicketPage);
		model.addAttribute("ticketStartPage", ticketStartPage);
		
		//사용내역
		/*
		 * Pageable pageableTicketLines = PageRequest.of((nowTicketLinesPage-1), 3,
		 * Direction.DESC, "ticketDate"); Page<TicketLines> ticketLines =
		 * adminService.findByTicketMemberMemberCode(pageableTicketLines, memberCode);
		 * int ticketLinesBlock = 5; int ticketLinesTemp = (nowTicketLinesPage-1) %
		 * ticketLinesBlock; int ticketLinesStartPage = nowTicketLinesPage -
		 * ticketLinesTemp; model.addAttribute("ticketLines", ticketLines);
		 * model.addAttribute("ticketLinesBlock", ticketLinesBlock);
		 * model.addAttribute("nowTicketLinesPage", nowTicketLinesPage);
		 * model.addAttribute("ticketLinesStartPage", ticketLinesStartPage);
		 */
		
		//리뷰
		Pageable pageableReview = PageRequest.of((nowReviewPage-1), 3, Direction.DESC, "reviewDate");
		Page<ReviewStar> reviewStar = adminService.findReviewByMemberMemberCode(pageableReview, memberCode);
		int reviewBlock = 5;
		int reviewTemp = (nowReviewPage-1) % reviewBlock;
		int reviewStartPage = nowReviewPage - reviewTemp;
		model.addAttribute("reviewStar", reviewStar);
		model.addAttribute("reviewBlock", reviewBlock);
		model.addAttribute("nowReviewPage", nowReviewPage);
		model.addAttribute("reviewStartPage", reviewStartPage);
		
		//상담
		Pageable pageableCounsel = PageRequest.of((nowCounselPage-1), 3, Direction.DESC, "counselReqDate");
		Page<Counsel> counsel = adminService.findCounselByMemberMemberCode(pageableCounsel, memberCode);
		int counselBlock = 5;
		int counselTemp = (nowCounselPage-1) % counselBlock;
		int counselStartPage = nowCounselPage - counselTemp;
		model.addAttribute("counsel", counsel);
		model.addAttribute("counselBlock", counselBlock);
		model.addAttribute("nowCounselPage", nowCounselPage);
		model.addAttribute("counselStartPage", counselStartPage);
		
		//일대일문의
		Pageable pageableContact = PageRequest.of(currentPage, 7, Direction.DESC, "contactCode");
		Page<Contact> contactPage = adminService.findContactByMemberMemberCode(pageableContact, memberCode);
		model.addAttribute("contactPage", contactPage);
		
		if(contactPage.hasNext()) {
			model.addAttribute("next", 1);
		}
		
		if(contactPage.hasPrevious()) {
			model.addAttribute("previous", 1);
		}
		
		
		
		
		
		
		System.out.println(pageableContact.hasPrevious());
		System.out.println(pageableContact.next());
		System.out.println(pageableContact.getPageNumber());
		
		
		//테스트
		/*List<Psychology> psychology = adminService.findPsychologyByMemberMemberCode(memberCode);
		model.addAttribute("psychology", psychology);*/
		
		return "admin/memberDetailView";
	}

/////////////////////////////////////////////////수현님 소스 끝////////////////////////////////////////////////////////////////	
	
	
	
	
	/**
	 * 14. 답변작성
	 */
	@RequestMapping("/insertContactReply/{contactCode}")
	public String insertContactReply(@PathVariable Long contactCode, ContactReply contactReply) {
		System.out.println(contactReply);
		return "redirect:/admin/viewContactDetail/{contactCode}";
	}

	/**
	 * (차트) 15.해당 월 기준 12개월간 상담 건수
	 */
	@ResponseBody
	@RequestMapping("/countCounselByMonth")
	public AjaxData countCounselByMonth() {
		return adminService.countCounselByMonth();
	}

	/**
	 * 회원상태 업데이트
	 */
	@RequestMapping("/update/{memberCode}")
	public String update(@PathVariable Long memberCode, Integer state, Integer type) {
		// System.out.println(state +", "+type);

		adminService.updateMember(memberCode, state);

		return "redirect:/admin/memberView";
	}

	/**
	 * 16. 해당 월 상담사 순위 조회(신청일, 상담건수 기준)
	 */
	@ResponseBody
	@RequestMapping("/rankCounselor")
	public AjaxDataTwo rankCouselorAjaxData() {
		System.out.println("옵니까!!");
		AjaxDataTwo ajaxDataTwo = adminService.rankCounselor();
		return ajaxDataTwo;

	}

	/**
	 * 17. 상담사 등록용 전체 상담사 조회
	 */
	@RequestMapping({ "/viewCounselorState", "/viewCounselorState/{counselorState}" })
	public String updateCounselorState(Model model, @RequestParam(defaultValue = "0") int currentPage,
			@PathVariable Optional<Integer> counselorState) {
		Pageable pageable = PageRequest.of(currentPage, 7, Direction.DESC, "counselorCode");
		Page<Counselor> pageList = adminService.findAllCounselor(pageable);
		Integer state = (counselorState.isPresent()) ? counselorState.get() : 4;

		if (state == 4) {
			model.addAttribute("pageList", pageList);
		} else {
			model.addAttribute("pageList", adminService.updateByCounselorState(state, pageable));
		}

		if (pageList.getTotalPages() == 0) {
			model.addAttribute("errorMessage", "조회된 상담사 회원이 없습니다.");
		}

		return "admin/counselorView";
	}

	
	/**
	 * 18. 자격증 다운로드
	 */
	@RequestMapping("/download")
	public ModelAndView download(String fileName, HttpSession session) {

		String path = session.getServletContext().getRealPath("/save");
		File file = new File(path + "/" + fileName);

		return new ModelAndView("downLoadView", "fname", file);
	}

	
	/**
	 * 19. 상담사 승인/ 반려
	 */
	@RequestMapping("/updateCounselorState/{memberCode}/{state}")
	public String approvalDenial(@PathVariable Long memberCode, @PathVariable int state) {
		Member member = adminService.findMember(memberCode);
		Counselor counselor = adminService.findCounselorByMemberCode(memberCode);

		if (state == 2) {

			counselor.setCounselorState(state);
			member.setMemberType(1);

			adminService.updateCounselorState(counselor);
			adminService.addAuthority(member);

		} else if (state == 1) {
			adminService.updateMemberType(member);

			counselor.setCounselorState(state);
			adminService.updateCounselorState(counselor);
		}

		return "redirect:/admin/viewCounselorState";
	}

	
	/**
	 * 20. 회원 이름/가명 검색
	 */
	@RequestMapping("/selectByNameAndAlias")
	public String selectByNameAndAlias(String keyword, @RequestParam(defaultValue = "0") int currentPage, Model model) {
		Pageable pageable = PageRequest.of(currentPage, 10, Direction.DESC, "memberCode");
		Page<Member> pageList = adminService.findByAliasAndName(pageable, keyword);
		model.addAttribute("pageList", pageList);

		if (pageList.getTotalPages() == 0) {
			model.addAttribute("errorMessage", "검색결과가 없습니다.");
		}

		return "admin/memberView";
	}

	/**
	 * 결제내역 조회
	 * 
	 * @param nowPage
	 * @return ModelAndView
	 */
	@RequestMapping("/ticketView")
	public ModelAndView list(@RequestParam(defaultValue = "0") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage, 15, Direction.DESC, "ticketCode");
		Page<Ticket> tkList = ticketService.selectAll(pageable);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/ticketView");
		mv.addObject("tkList", tkList);
		mv.addObject("previous", pageable.previousOrFirst().getPageNumber());
		mv.addObject("next", pageable.next().getPageNumber());
		return mv;
	}
	
	/**
	 * 상담권 사용 내역 전체보기 : 관리자
	 * */
	@RequestMapping("/viewTicketLines")
	public String ticketLinesList(@RequestParam(defaultValue = "0") int nowPage, Model model) {
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "ticketLinesDate");
		Page<TicketLines> tlList = ticketLinesService.selectAll(pageable);
		
		if(tlList.getTotalPages() == 0) {
			model.addAttribute("errorMessage", "상담권 사용내역이 없습니다.");
		}
		
		return "admin/ticketLineView";
	}
	
	/**
	 * 21. 기간별 매출액조회
	 */
	
	  @RequestMapping("/selectTicketBetween") 
	  public String selectTicketBetween(@RequestParam(defaultValue = "0")int currentPage, String from, String to, Model model) { 
		  Pageable pageable = PageRequest.of(currentPage, 10, Direction.DESC, "ticketCode");
	  Page<Ticket> tickets = adminService.selectSalesBetween(pageable, from, to);
	  	model.addAttribute("tkList", tickets);
	  
	  return "admin/ticketView"; 
	  
	  
	  }
	 
	
	
	
	/**
	 * 22. (리스트) 해당월 매출액 조회
	 */
	public String selectSalesThisMonth(){
		int monthIncome = adminService.incomeMonth();
		String result = null;
		double income = 0.0;
		
		if (monthIncome >= 10000000) {
			income = (monthIncome/10000000);
			result = income + "M";	
		} else if (monthIncome >= 1000) {
			income = (monthIncome/1000);
			result = income + "K";
		}
		return result;
	}




}	
