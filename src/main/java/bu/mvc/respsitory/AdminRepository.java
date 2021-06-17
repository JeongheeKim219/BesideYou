package bu.mvc.respsitory;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.aspectj.weaver.tools.Trace;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
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
	 * 5. 상담 건수별 상담사 등급 조회
	 */
	@Query(value = "SELECT COUNSELOR, COUNT, RANKING FROM ("
			+ "SELECT COUNSELOR_CODE AS COUNSELOR, COUNT(*) AS COUNT,  RANK () OVER (ORDER BY COUNT(*) DESC) AS RANKING "
			+ "FROM COUNSEL WHERE TO_CHAR(COUNSEL_REQ_DATE, 'yyyy/mm') = TO_CHAR(:date, 'yyyy/mm') "
			+ "GROUP BY COUNSELOR_CODE) WHERE RANKING < :rank", nativeQuery = true)
	public List<Map<String, Object>> selectCounselorByRanking(@Param("date") LocalDate date, @Param("rank")int rank);
	
	
	/**
	 * 6. 회원 타입별 전체 조회
	 */
	List<Member> findByMemberType(int type);

	
} 
