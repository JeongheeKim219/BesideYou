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

import bu.mvc.domain.Counselor;
import bu.mvc.domain.Speciality;
import bu.mvc.respsitory.CounselorRepository;
import bu.mvc.respsitory.MemberRepository;
import bu.mvc.respsitory.PriceRepository;
import bu.mvc.respsitory.SpecialityRepository;
import bu.mvc.respsitory.TagRepository;

import bu.mvc.domain.Member;
import bu.mvc.respsitory.AdminRepository;

@SpringBootTest
@Transactional
@Commit
class BesideYouApplicationTests {

	@Autowired
	private AdminRepository adminRep;

	@Autowired
	private MemberRepository testRep;

	@Autowired
	private CounselorRepository testRep2;

	@Autowired
	private PriceRepository priceRep;
	@Autowired
	private TagRepository tagRep;

	@Autowired
	private SpecialityRepository specialityRep;

	/*
	 * @Test void insert() { testRep.save(new Member(null, "admin2", "1234", "관리자",
	 * null, "테스트", "11-111", "qo10@na", 0, 3, LocalDate.of(1998, 8, 20), null)); }
	 */

	@Test
	void delete() {
		testRep2.deleteById(16L);
	}

	/*
	 * @Test public void update() {
	 * 
	 * Member member = testRep.findById(3L).orElse(null); member.setId("admin");
	 * 
	 * 
	 * }
	 */
	/*
	 * @Test void insert2() { testRep2.save(new Counselor(null, 5.12 ,6.122, "경력",
	 * "박D사", "오리역", "자격증", "a.jpg", 1,new Member(3L))); }
	 */

	/*
	 * @Test void insert() { priceRep.save(new Price(null, 0, 5000, new
	 * Counselor(17L))); }
	 * 
	 * @Test void update() { Price price = priceRep.findById(1000L).orElse(null);
	 * price.setCounselorPrice(10000); }
	 */

	/*
	 * @Test void insert() { tagRep.save(new Tag(null, "#가정, #친구", new
	 * Counselor(17L))); }
	 */
	@Test
	void insert() {
		specialityRep.save(new Speciality(null, "청소년전문상담사", new Counselor(17L)));
	}

	@Test
	void newMember() {
		LocalDateTime start = LocalDateTime.of(LocalDate.now().minusDays(1), LocalTime.of(0, 0, 0));
		LocalDateTime end = LocalDateTime.of(LocalDate.now(), LocalTime.of(23, 59, 59));

		List<Member> newMemeberList = adminRep.findByDateOfRegBetween(start, end);
		newMemeberList.forEach(m -> System.out.println(m));

	}

}
