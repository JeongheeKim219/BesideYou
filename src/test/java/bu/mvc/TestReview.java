package bu.mvc;

import java.util.Date;
import java.util.List;

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
	private ReviewRepository rr;

	@Test
	void selectAll() {
		List<ReviewStar> rs = rr.findAll();
		System.out.println("RS :" + rs.toString());
	}
	
	/**
	 * 상담사 코드에 따른 검색
	 * */
	@Test
	void selectByNum() {
		List<ReviewStar> rs = rr.selectByCounCode(1L);
		System.out.println("RS ============" + rs.toString());
	}

}
