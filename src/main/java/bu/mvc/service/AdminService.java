package bu.mvc.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import bu.mvc.domain.Counsel;
import bu.mvc.domain.Counselor;
import bu.mvc.domain.Member;
import bu.mvc.domain.Ticket;
import bu.mvc.respsitory.AdminRepository;
import bu.mvc.respsitory.CounselRepository;
import bu.mvc.respsitory.CounselorRepository;
import bu.mvc.respsitory.TicketRepository;

@Service
@Transactional
public class AdminService {

	@Autowired
	private AdminRepository adminRep;

	@Autowired
	private CounselRepository counselRep;

	@Autowired
	private TicketRepository ticketRep;

	@Autowired
	private CounselorRepository counselorRep;

	private LocalDateTime start = LocalDateTime.of(LocalDate.now().minusDays(1), LocalTime.of(23, 59, 59));
	private LocalDateTime end = LocalDateTime.now();

	

	/**
	 * 1. 신규 상담사와 일반회원 모두 조회
	 */
	public List<Member> selectNewMemberList() {
		return adminRep.findByDateOfRegBetween(start, end);
	}

	
	/**
	 * 1_1. 신규 회원을 타입별로 조회
	 */
	public List<Member> selectNewByType(int memberType) {
		ArrayList<Member> list = new ArrayList<Member>();

		for (Member m : selectNewMemberList()) {
			if (m.getMemberType() == memberType) {
				list.add(m);
			}
		}
		return list;
	}

	
	/**
	 * 2. 전체 일반 회원 조회(+페이징) 수정필요!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	 */
	public Page<Member> selectAll(Pageable pageable) {
		return adminRep.findAll(pageable);
	}

	
	/**
	 * 3. 당일 새로운 상담 신청 조회
	 */
	public List<Counsel> countNewCounsel() {
		return counselRep.findAllByCounselReqDateBetween(start, end);
	}

	
	/**
	 * 4. 당일 상품권 구매 조회
	 */
	public List<Ticket> salesToday() {
		return ticketRep.findByTicketDateBetween(start, end);
	}

	
	/**
	 * 5. 당일 상품권 매출 금액 조회
	 */
	public int incomeToday() {
		List<Ticket> ticketList = new ArrayList<Ticket>();
		int income = 0;

		for (Ticket ticket : ticketList) {
			income += (ticket.getTicketAmount() * ticket.getTicketPrice())
					* (1 - ticket.getDiscount().getDiscountRate() * 0.01);
		}
		return income;
	}

	
	/**
	 * 6. 상담 신청 현황 조회
	 */
	public Map<String, List<Counsel>> counselByState() {
		Map<String, List<Counsel>> map = new HashMap<>();
		int year = LocalDate.now().getYear();
		int month = LocalDate.now().getMonthValue();

		map.put("pending", counselRep.findAllByCounselState(0));//신청
		map.put("denied", counselRep.findAllByCounselState(1));//반려
		map.put("approval", counselRep.findAllByCounselState(2));//승인

		// 상태가 완료인 경우(월)
		List<Counsel> doneList = counselRep.findAllByCounselState(3);
		for (Counsel counsel : doneList) {
			if (month == counsel.getCounselDate().getMonthValue() 
					&& year == counsel.getCounselDate().getYear()) {
				doneList.add(counsel);
			}
		}
		map.put("done", doneList);

		return map;
	}

	
	/**
	 * 7. 상담사 신청 현황 조회
	 */
	public Map<String, List<Counselor>> counselorByState() {
		Map<String, List<Counselor>> map = new HashMap<>();

		map.put("counselorPending", counselorRep.findAllByCounselorState(0));//신청
		
		
		for(Counselor counselor :counselorRep.findAllByCounselorState(0)) {
			System.out.println(counselor);
		}
		
		
		
		map.put("counselorDenied", counselorRep.findAllByCounselorState(1));//반려
		map.put("counselorApproval", counselorRep.findAllByCounselorState(2));//승인
		map.put("counselorRevoke", counselorRep.findAllByCounselorState(3));//자격해지
		
		return map;
	}



}
