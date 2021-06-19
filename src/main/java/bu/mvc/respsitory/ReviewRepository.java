package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.Counselor;
import bu.mvc.domain.ReviewStar;

public interface ReviewRepository extends JpaRepository<ReviewStar, Long> {
	@Query("select r from ReviewStar r where counselor.counselorCode=?1")
	List<ReviewStar> selectByCounCode(Long counselor, Pageable pageable);
	
	//List<ReviewStar> selectByCounCode(Counselor counselor, Pageable pageable);
	
	
	
	@Query("select round(avg(star),1) from ReviewStar r where counselor.counselorCode=?1")
	double selectStarAvg(Long counselorCode);

	
}
