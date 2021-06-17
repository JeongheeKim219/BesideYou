package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.ArtCounselor;
import bu.mvc.domain.Counselor;


public interface CounselorRepository extends JpaRepository<Counselor, Long>{

	/**
	 * 멤버코드에 해당하는 카운슬러 검색
	 * */
	@Query("select c from Counselor c where c.member.memberCode=?1")
	Counselor searchBymembercode(Long mem);

	/**
	 * 1. 상담사 상태별 조회
	 */
	List<Counselor> findAllByCounselorState(int state);

}
