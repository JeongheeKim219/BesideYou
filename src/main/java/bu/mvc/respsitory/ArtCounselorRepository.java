package bu.mvc.respsitory;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.ArtCounselor;
import bu.mvc.domain.Counselor;

public interface ArtCounselorRepository extends JpaRepository<ArtCounselor, Long> {

	/**
	 * 상담사code 에 해당하는 그림상담사 조회
	 * */
	@Query("select z from ArtCounselor z where counselor=?1")
	ArtCounselor selectByCounselorCode(Counselor co);
	
	/**
	 * 그림상담사 state 0 (그림상담사로 등록되어 있는) 거 조회
	 * */
	@Query("select a from ArtCounselor a where a.artCounselorState=0")
	Page<ArtCounselor> selectByArtCounselorState(Pageable pageable);
	
}
