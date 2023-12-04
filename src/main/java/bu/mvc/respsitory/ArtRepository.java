package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.Art;
import bu.mvc.domain.ArtCounselor;

public interface ArtRepository extends JpaRepository<Art, Long> {

	/**
	 * 그림상담사를 대상으로 검색
	 * */
	@Query("select a from Art a where a.artCounselor = ?1 order by a.artDate desc")
	List<Art> searchByCounselor(ArtCounselor ac);
	
	@Query("select a from Art a where a.artCounselor.artCounselorCode = ?1")
	List<Art> searchByCounselor2(Long artCounselorCode);
	
	/**
	 * 멤버를 대상으로 검색
	 * */
	@Query("select a from Art a where a.member.memberCode=?1 order by a.artDate desc")
	List<Art> searchByMem(Long member);
	
}
