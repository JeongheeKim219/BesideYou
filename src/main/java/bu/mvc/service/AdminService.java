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

import bu.mvc.domain.Member;
import bu.mvc.respsitory.AdminRepository;

@Service
@Transactional
public class AdminService {

	@Autowired
	private AdminRepository adminRep;
	
	/**
	 * 1. 신규 상담사와 일반회원 모두 조회
	 */
	public List<Member> selectNewMemberList(){
		LocalDateTime start = LocalDateTime.of(LocalDate.now().minusDays(1), LocalTime.of(0,0,0));
		LocalDateTime end = LocalDateTime.now();
		return adminRep.findByDateOfRegBetween(start, end);
	}
	
	
	/**
	 * 1_1. 신규 회원을 타입별로 조회
	 */
	public List<Member> selectNewByType(int memberType) {
		ArrayList<Member> list = new ArrayList<Member>();
		
		for(Member m : selectNewMemberList()) {
			if(m.getMemberType() == memberType) {
				list.add(m);
			}
		}
		return list;
	}
	
	
	
	
	/**
	 * 2. 전체 회원 조회(+페이징)
	 */
	public Page<Member> selectAll(Pageable pageable) {
		return adminRep.findAll(pageable);
	}
	
	
}
