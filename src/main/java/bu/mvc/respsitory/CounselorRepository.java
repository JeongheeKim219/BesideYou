package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Counselor;


public interface CounselorRepository extends JpaRepository<Counselor, Long>{

	/**
	 * 1. 상담사 상태별 조회
	 */
	List<Counselor> findAllByCounselorState(int state);
	
	
}
