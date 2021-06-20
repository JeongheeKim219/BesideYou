package bu.mvc.respsitory;

<<<<<<< HEAD
import java.util.Date;
=======
>>>>>>> gihun
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.Report;

public interface ReportRepository extends JpaRepository<Report, Long> {
	
	
	@Query("select r from ReviewStar r where r.reviewCode=?1")
	List<Report> selectByReviewNo(Long reviewCode);
	
	


	
}
