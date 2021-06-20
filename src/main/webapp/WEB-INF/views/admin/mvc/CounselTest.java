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
import bu.mvc.domain.RequestAns;
import bu.mvc.domain.Requests;
import bu.mvc.respsitory.CounselRepository;
import bu.mvc.respsitory.RequestAnsRepository;
import bu.mvc.respsitory.RequestRepository;


@SpringBootTest
@Transactional
@Commit
class CounselTest {

	@Autowired
	private CounselRepository counselRep;
	
	@Autowired
	private RequestRepository requestRep;
	
	@Autowired
	private RequestAnsRepository requestAnsRep;

	@Test
	void insertCounsel() {
		//counselRep.save(new Counsel(null, new Member(4L), new Counselor(1L), 3, 1, new Date()));
	}

	@Test
	void insertRequest() {
		requestRep.save(new Requests(null, new Counsel(2L), "제목제목", 3, "내용내용내용"));
	}
	
	@Test
	void insertRequestAns() {
		requestAnsRep.save(new RequestAns(null, new Requests(1L), new Counselor(1L), "답변드립니다."));
	}

}
