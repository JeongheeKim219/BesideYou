package bu.mvc.respsitory;

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
}
