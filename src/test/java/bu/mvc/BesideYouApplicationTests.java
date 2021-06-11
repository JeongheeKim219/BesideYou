package bu.mvc;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

<<<<<<< HEAD
import bu.mvc.domain.TestJPA;
import bu.mvc.respsitory.TestRepository;
=======
import bu.mvc.domain.Member;
import bu.mvc.respsitory.AdminRepository;
>>>>>>> main

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
