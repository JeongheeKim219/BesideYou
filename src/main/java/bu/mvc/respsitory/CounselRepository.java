package bu.mvc.respsitory;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.Counsel;
import bu.mvc.domain.Member;

public interface CounselRepository extends JpaRepository<Counsel, Long> {
	
	Page<Counsel> findByMember(Member member, Pageable pageable);
	
	@Query("select c from Counsel c where c.member.memberCode = ?1 and c.counselCategory in (0,1,2) order by c.counselReqDate desc")
	Page<Counsel> findForUser(Long memberCode, Pageable pageable);
	
	@Query("select c from Counsel c where c.member.memberCode = ?1 and c.counselCategory = ?2 order by c.counselReqDate desc")
	Page<Counsel> findForUserField(Long memberCode, int field, Pageable pageable);
}
