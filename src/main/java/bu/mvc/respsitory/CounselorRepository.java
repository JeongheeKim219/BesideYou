package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
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
	 * 상담사정보 수정하기
	 * */
/*	@Query("update Counselor c set  c.career=?1 where c.counselorCode=?2")
	@Modifying
	void updateCounselor(String career, Long counselorCode);*/
	
}
