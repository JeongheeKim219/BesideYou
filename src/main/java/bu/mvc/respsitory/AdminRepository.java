package bu.mvc.respsitory;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import bu.mvc.domain.Contact;
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
	 * 3. 일반 회원 증가 추이 검색
	 */
	@Query(value = "SELECT TO_CHAR(DATE_OF_REG, 'yy/mm/dd') AS DAY, COUNT (*) AS COUNT FROM MEMBER GROUP BY TO_CHAR(DATE_OF_REG, 'yy/mm/dd') ORDER BY DAY", nativeQuery = true)
	List<Map<String, Object>> countJoinMember();

	
	/**
	 * 4. 테스트 쿼리
	 */
	@Query(value = "SELECT TO_CHAR(DATE_OF_REG, 'yy/mm/dd') AS DAY, COUNT (*) AS COUNT FROM MEMBER GROUP BY TO_CHAR(DATE_OF_REG, 'yy/mm/dd') ORDER BY DAY DESC", nativeQuery = true)
	List<Integer> countJoinMember2(String dateString);

	
	
	@Query("SELECT TO_CHAR(m.dateOfReg, 'yy/mm/dd') AS DAY, COUNT (*) AS COUNT FROM Member m "
			+ "GROUP BY TO_CHAR(m.dateOfReg, 'yy/mm/dd') HAVING TO_CHAR(m.dateOfReg, 'yy/mm/dd') =?1 ORDER BY DAY")
	Map<String, Object> countJoinMember3(String string);
	
}
