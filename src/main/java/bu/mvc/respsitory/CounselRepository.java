package bu.mvc.respsitory;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.Counsel;
import bu.mvc.domain.Counselor;
import bu.mvc.domain.Member;

public interface CounselRepository extends JpaRepository<Counsel, Long> {
	
	Page<Counsel> findByMember(Member member, Pageable pageable);
	
	@Query("select c from Counsel c where c.member.memberCode = ?1 and c.counselCategory in (0,1,2)")
	Page<Counsel> findForUser(Long memberCode, Pageable pageable);
	
	@Query("select c from Counsel c where c.member.memberCode = ?1 and c.counselCategory = ?2")
	Page<Counsel> findForUserField(Long memberCode, int field, Pageable pageable);
	
	@Query("select c from Counsel c where c.counselor =?1 and c.counselCategory in (0,1,2)")
	Page<Counsel> findByCounselor(Counselor counselor, Pageable pageable);
	
	@Query("select c from Counsel c where c.counselor =?1 and c.counselCategory =?2")
	Page<Counsel> findByCounselorField(Counselor counselor, int field, Pageable pageable);
	
	@Query("update Counsel c set c.counselState=2 where c.counselCode=?1")
	@Modifying
	void approveCounsel(Long counselCode);
	
	@Query("update Counsel c set c.counselState=1 where c.counselCode=?1")
	@Modifying
	void rejectCounsel(Long counselCode);
	
	@Query("update Counsel c set c.counselState=3 where c.counselCode=?1")
	@Modifying
	void completeCounsel(Long counselCode);
	
}
