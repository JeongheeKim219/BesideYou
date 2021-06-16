package bu.mvc.respsitory;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import bu.mvc.domain.Member;

@Repository
public interface AdminRepository extends JpaRepository<Member, Long> {

	/**
	 * 1. 신규회원 수 검색(해당일 기준)
	 */
	List<Member> findByMemberStateAndDateOfRegBetween(int state, LocalDateTime start, LocalDateTime end);

	
	/**
	 * 2. 전체 회원 타입별 조회
	 * @param pageable
	 * @return Page<Member>
	 */
	Page<Member> findAllByMemberType(int type, Pageable pageable);
	
	
	
	/**
	 * 3. 신규 일반 회원 인원수 일자별 검색
	 * @param string
	 * @return
	 */
	@Query("SELECT TO_CHAR(m.dateOfReg, 'yy/mm/dd') AS DAY, COUNT (*) AS COUNT FROM Member m WHERE m.memberType = 0 "
			+ "GROUP BY TO_CHAR(m.dateOfReg, 'yy/mm/dd') HAVING TO_CHAR(m.dateOfReg, 'yy/mm/dd') =?1 ORDER BY DAY")
	Map<String, Object> countJoinMember3(String date);
	
	
	/**
	 * 4. 월별 상담신청 건수 검색
	 */
	@Query("SELECT TO_CHAR(c.counselReqDate, 'yyyy/mm') AS MONTH, COUNT (*) AS COUNT FROM Counsel c GROUP BY TO_CHAR(c.counselReqDate, 'yyyy/mm')" 
			+ "HAVING TO_CHAR(c.counselReqDate, 'yyyy/mm') = ?1 ORDER BY MONTH")
	Map<String, Object> countCounselReqByMonth(String date);


	/**
	 * 4. 월별 상담 건수 검색
	 */
	@Query("SELECT TO_CHAR(c.counselDate, 'yyyy/mm') AS MONTH, COUNT (*) AS COUNT FROM Counsel c GROUP BY TO_CHAR(c.counselDate, 'yyyy/mm')" 
			+ "HAVING TO_CHAR(c.counselDate, 'yyyy/mm') = ?1 ORDER BY MONTH")
	Map<String, Object> countCounselByMonth(String date);

	
	
	/**
	 * 테스트용
	 */
	//List<Member> findByPasswordStartsWith(String string);
	List<Member> findByMemberType(int type);

	
	/**
	 * 
	 */
	
} 
