package bu.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bu.mvc.domain.Refund;
import bu.mvc.service.RefundService;

@Controller
@RequestMapping("/refund")
public class RefundController {

	@Autowired
	private RefundService refundService;
	
	/**
	 * 환불 신청 목록 전체 보기 : 관리자용
	 *  - 전체 리스트 페이징 처리
	 * */
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam(defaultValue = "0") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "ticketCode");
		Page<Refund> rfList = refundService.selectAll(pageable);
		return new ModelAndView("refund/listAdmin", "rfList", rfList);
	}
	
	/**
	 * 회원 id로 환불 신청 내역 검색하기 : 로그인한 사용자용
	 *  - 회원 id로 검색하여 사용자 마이페이지에서 출력
	 *  - 검색 결과 페이징 처리
	 * */
	@RequestMapping("/myList")
	public ModelAndView myList(String id, @RequestParam(defaultValue = "0") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "ticketCode");
		List<Refund> myList = refundService.searchBy(id, pageable);
		return new ModelAndView("refund/list", "myList", myList);
	}
	
	/**
	 * 환불 신청 폼
	 * */
	@RequestMapping("/application")
	public void application() {}
	
	/**
	 * 환불 신청 완료
	 * */
	@RequestMapping("/request")
	public String request(Refund refund) {
		refundService.insert(refund);
		return "redirect:/refund/myList";
	}
	
	/**
	 * 환불 신청 내역 상세보기
	 * */
	@RequestMapping("/read")
	public ModelAndView refundDetail(Long refundCode) {
		Refund refund = refundService.selectByCode(refundCode);
		return new ModelAndView("refund/detail", "refund", refund);
	}
	
	/**
	 * 환불 처리하기
	 *  1. 상담권 잔여량이 남아있을 때만 환불 가능.
	 *  2. 상담권 잔여량이 남아있을 경우 잔여량을 0으로 만든다.
	 *  3. 환불 불가 결정 or 환불 완료시 신청 내역의 진행 상태를 변경한다.
	 * */
	@RequestMapping("/process")
	public String refundTicket(Refund refund) {
		refundService.refundTicket(refund);
		return "redirect:/refund/myList";
	}
	
	/**
	 * 환불 신청 내역 삭제하기
	 * */
	@RequestMapping("/delete")
	public String delete(Long refundCode) {
		refundService.delete(refundCode);
		return "redirect:/refund/myList";
	}
	
}
