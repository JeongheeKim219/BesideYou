package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.Counselor;
import bu.mvc.domain.ReviewStar;

public interface ReviewRepository extends JpaRepository<ReviewStar, Long> {
	@Query("select r from ReviewStar r where r.counselor.counselorCode=?1")
	//List<ReviewStar> selectByCounCode(Long counselorCode);
	List<ReviewStar> selectByCounCode(Long counselorCode, Pageable pageable);
	
	
	
	
	@Query("select round(avg(star),1) from ReviewStar r where r.counselor.counselorCode=?1")
	Double selectStarAvg(Long counselorCode);

/////6월 18일 정희 추가///////////////////////////////////////////////////////////////////////////////////////
	
	
	List<ReviewStar> findByCounselor(Counselor counselor);
	
	
//////////////////////////////////////////////////////////////////////////////////////////////

	Page<ReviewStar> findByMemberMemberCode(Pageable pageable, Long memberCode);
}

