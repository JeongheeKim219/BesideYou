package bu.mvc;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import bu.mvc.domain.Member;
import bu.mvc.domain.TestJPA;
import bu.mvc.respsitory.AdminRepository;
import bu.mvc.respsitory.TestRepository;

@SpringBootTest
@Transactional
@Commit
class BesideYouApplicationTests {

	@Autowired
	private TestRepository testRep;
	
	@Autowired
	private AdminRepository adminRep;

	@Test
	void insert() {
		testRep.save(new TestJPA(1, "확인1"));
	}
	
	@Test
	void newMember() {

		List<Member> newMemeberList =  adminRep.findNewMembers();
		newMemeberList.forEach(m -> System.out.println(m));
	
	}

}
