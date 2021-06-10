package bu.mvc;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
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
	void newMember() {
		LocalDateTime start = LocalDateTime.of(LocalDate.now().minusDays(1), LocalTime.of(0,0,0));
		LocalDateTime end = LocalDateTime.of(LocalDate.now(), LocalTime.of(23,59,59));
		
		List<Member> newMemeberList =  adminRep.findByDateOfRegBetween(start, end);
		newMemeberList.forEach(m -> System.out.println(m));
	
	}
	
	@Test
	void memberInsert() {
		testRep.save(new TestJPA(null, "hanna", "test", "김민경", "장군", "서울시 마포구 동교동", "010-3882-6789",
				"strong@gmail.com", LocalDate.of(2001, 2, 3), LocalDateTime.of(2001, 2, 3, 23, 3, 12), 0, 0));
	}

}
