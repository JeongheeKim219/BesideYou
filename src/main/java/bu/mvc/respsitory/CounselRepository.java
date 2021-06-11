package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Counsel;

public interface CounselRepository extends JpaRepository<Counsel, Long> {
	
	/**
	 * 1. 신규 상담 신청 조회
	 */
	List<Counsel> findByCounselStateIs(int state);


}
