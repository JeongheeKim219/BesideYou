package bu.mvc.respsitory;

import java.util.List;

<<<<<<< HEAD
import org.springframework.data.domain.Page;
=======
>>>>>>> gihun
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.Counselor;
import bu.mvc.domain.ReviewStar;

public interface ReviewRepository extends JpaRepository<ReviewStar, Long> {
<<<<<<< HEAD
	@Query("select r from ReviewStar r where r.counselorCode.counselorCode=?1")
	//List<ReviewStar> selectByCounCode(Long counselorCode);
	List<ReviewStar> selectByCounCode(Long counselorCode, Pageable pageable);
	
	
	
	
	@Query("select round(avg(star),1) from ReviewStar r where r.counselorCode.counselorCode=?1")
	Double selectStarAvg(Long counselorCode);

/////6월 18일 정희 추가///////////////////////////////////////////////////////////////////////////////////////
	
	
	List<ReviewStar> findByCounselorCode(Counselor counselor);
	
	
//////////////////////////////////////////////////////////////////////////////////////////////

	Page<ReviewStar> findByMemberMemberCode(Pageable pageable, Long memberCode);
=======
	@Query("select r from ReviewStar r where counselor.counselorCode=?1")
	List<ReviewStar> selectByCounCode(Long counselor, Pageable pageable);
	
	//List<ReviewStar> selectByCounCode(Counselor counselor, Pageable pageable);
	
	
	
	@Query("select round(avg(star),1) from ReviewStar r where counselor.counselorCode=?1")
	double selectStarAvg(Long counselorCode);

	
>>>>>>> gihun
}

