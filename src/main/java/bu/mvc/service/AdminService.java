package bu.mvc.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

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
	 * 1. 신규 회원 조회
	 */
	public List<Member> selectNewMemberList(){
		LocalDateTime start = LocalDateTime.of(LocalDate.now().minusDays(1), LocalTime.of(0,0,0));
		LocalDateTime end = LocalDateTime.now();
		return adminRep.findByDateOfRegBetween(start, end);
	}
	
	/**
	 * 2. 전체 회원 조회(+페이징)
	 */
	public Page<Member> selectAll(Pageable pageable) {
		return adminRep.findAll(pageable);
	}
	
	
}
