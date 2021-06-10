package bu.mvc.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		int newMemberCount = selectNewMemberList().size();
		
		model.addAttribute("now", now);
		model.addAttribute("newMemberCount", newMemberCount);
		
		return "admin/index";
	}
	
	/**
	 * 2. 신규 회원 수 조회
	 */
	public List<Member> selectNewMemberList() {
		return adminService.selectNewMemberList();
	}
	
	
	/**
	 * 3. 회원 통계 페이지로 이동
	 */
	
	@RequestMapping("/memberSummary")
	public String summary() {
		return "admin/memberSummary";
	}
	
	
	/**
	 * 4. 회원 전체 보기 페이지로 이동
	 * 1) 전체 회원 조회
	 * 2) 페이징
	 */
	@RequestMapping("/memberView")
	public String select(Model model, @RequestParam(defaultValue = "0") int currentPage) {
		
		Pageable pageable = PageRequest.of(currentPage, 15, Direction.DESC, "dateOfReg");
		Page<Member> pageList = adminService.selectAll(pageable);		
		model.addAttribute("pageList", pageList);
		
		return "admin/memberView";
	}
	
	
	
	
}
