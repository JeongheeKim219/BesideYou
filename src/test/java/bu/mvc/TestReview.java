package bu.mvc;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import bu.mvc.respsitory.ReportRepository;

@SpringBootTest
@Transactional
@Commit
public class TestReview {
	@Autowired
	//private ReviewTestRepository rep;
	private ReportRepository rep;
	
	/*
	 * @Test void inset() { //rep.save(new ReviewStar(null, new Member(4L), new
	 * Counselor(1L), new Counsel(2L), 4.0, "테스트")); rep.save(new Report(null, new
	 * Member(4L), new ReviewStar(1L))); }
	 */
}


