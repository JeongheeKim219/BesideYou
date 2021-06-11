package bu.mvc;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import bu.mvc.domain.TestJPA;
import bu.mvc.respsitory.TestRepository;

@SpringBootTest
@Transactional
@Commit
class BesideYouApplicationTests {

	@Autowired
	private TestRepository testRep;

	@Test
	void insert() {
		testRep.save(new TestJPA(1, "확인1"));
	}

	
}
