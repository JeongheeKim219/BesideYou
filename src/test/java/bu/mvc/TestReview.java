package bu.mvc;

import java.util.Date;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import bu.mvc.domain.Counsel;
import bu.mvc.domain.Counselor;
import bu.mvc.domain.Member;
import bu.mvc.domain.Report;
import bu.mvc.domain.ReviewStar;
import bu.mvc.respsitory.ReportRepository;
import bu.mvc.respsitory.ReviewRepository;

@SpringBootTest
@Transactional
@Commit
public class TestReview {
	@Autowired
	//private ReviewTestRepository rep;
	private ReportRepository rep;
	
	@Test
	void inset() {
		//rep.save(new ReviewStar(null, new Member(4L), new Counselor(1L), new Counsel(2L), 4.0, "테스트"));
		rep.save(new Report(null, new Member(4L), new ReviewStar(1L)));
	}

}


