package bu.mvc.respsitory;

import java.util.List;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

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
	
	/**
	 * 2. 상담사 신청/등록용 페이지
	 */
	Page<Counselor> findByCounselorState(int state, Pageable pageable);

	

	/**
	 * 상담사정보 수정하기
	 * */
/*	@Query("update Counselor c set  c.career=?1 where c.counselorCode=?2")
	@Modifying
	void updateCounselor(String career, Long counselorCode);*/

	/**
	 * 3. 상담사 전체 조회
	 */
	Page<Counselor> findAll(Pageable pageable);

	@Query("select c from Counselor c where c.counselorState=2")
	List<Counselor> selectAll();

	////////기현
	@Query("select c from Counselor c where c.counselorState=2")
	Page<Counselor> selectCounselor(Pageable pageable);
}
