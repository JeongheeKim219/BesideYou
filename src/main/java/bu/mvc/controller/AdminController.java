package bu.mvc.controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

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

import bu.mvc.domain.AjaxData;
import bu.mvc.domain.Contact;
import bu.mvc.domain.ContactReply;
import bu.mvc.domain.Counsel;
import bu.mvc.domain.Counselor;
import bu.mvc.domain.Member;
import bu.mvc.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

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

		return "admin/index";
	}

	/**
	 * 2. 신규 회원 타입별 가입자 인원수 조회
	 */
	public List<Member> selectNewByType(int memberType) {
		return adminService.selectNewMemberList(memberType);
	}

	/**
	 * 3. 회원 통계 페이지로 이동 !!!!!!!!!!!!!!!!!!!!!!!!!!세부 데이터 필요!!!!!!!!!!!!!!!!!!!!!!!!
	 */
	@RequestMapping("/memberSummary")
	public String summary(Model model) {

		return "admin/memberSummary";
	}

	/**
	 * 4. 일반 회원 전체 보기 페이지로 이동 1) 전체 회원 조회 2) 페이징
	 */
	@RequestMapping("/memberView")
	public String select(Model model, @RequestParam(defaultValue = "0") int currentPage) {

		Pageable pageable = PageRequest.of(currentPage, 15, Direction.DESC, "memberCode");
		Page<Member> pageList = adminService.selectAllByType(0, pageable);
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
	 * 8. 상담사 등록 현황 조회(누적되므로 의논 필요) 의논 필요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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


	/**
	 * 11. 회원 정보 상세보기 페이지로 이동
	 */
	@RequestMapping("/memberDetailView/{memberCode}")
	public String viewMemberDetail(@PathVariable Long memberCode, Model model) {
		Member member = adminService.selectMember(memberCode);
		model.addAttribute("member", member);
		return "admin/memberDetailView";
	}

	
	/**
	 * 12. 문의내역 처리 게시판으로 이동 +) 문의내역 검색
	 */
	@RequestMapping("/contactView")
	public String viewContact(Model model, @RequestParam(defaultValue = "0") int currentPage) {

		Pageable pageable = PageRequest.of(currentPage, 15, Direction.DESC, "contactCode");
		Page<Contact> contactPageList = adminService.selectAllContact(pageable);
		model.addAttribute("contactPageList", contactPageList);
		return "admin/contactView";
	}

	
	/**
	 * 13. 문의 상세보기 페이지로 이동
	 * 
	 * @param contactCode
	 * @return "admin/contactDetailView"
	 */
	@RequestMapping("/viewContactDetail/{contactCode}")
	public String viewContactDetail(Model model, @PathVariable Long contactCode) {
		Contact contact = adminService.selectContactById(contactCode);
		model.addAttribute("contact", contact);
		return "admin/contactDetailView";
	}

	
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
	public AjaxData countCounselByMonth(){
		return adminService.countCounselByMonth();
	}
	
	/**
	 * 회원상태, 회원타입 업데이트
	 * */
	@RequestMapping("/update/{memberCode}")
	public String update(@PathVariable Long memberCode, Integer state, Integer type) {
		//System.out.println(state +", "+type);
		adminService.updateMember(memberCode, state);
		return "/admin/index";
		
	}
	
	
}



