package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Counselor;


public interface CounselorRepository extends JpaRepository<Counselor, Long>{

	/**
	 * 멤버코드에 해당하는 카운슬러 검색
	 * */
	
}
