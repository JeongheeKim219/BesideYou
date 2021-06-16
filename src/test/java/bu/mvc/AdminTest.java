package bu.mvc;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.assertj.core.util.Arrays;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import bu.mvc.domain.Counsel;
import bu.mvc.domain.Counselor;
import bu.mvc.domain.Member;
import bu.mvc.domain.Speciality;
import bu.mvc.respsitory.AdminRepository;
import bu.mvc.respsitory.CounselRepository;
import bu.mvc.respsitory.CounselorRepository;
import bu.mvc.respsitory.SpecialityRepository;

@Commit
@Transactional
@SpringBootTest
public class AdminTest {

	@Autowired
	private AdminRepository adminRep;

	@Autowired
	private CounselRepository counselRep;

	@Autowired
	private CounselorRepository counselorRep;

	@Autowired
	private SpecialityRepository specialityRep;

	@Test
	void test_one() {
		adminRep.findAll();
	}

	/*
	 * @Test void test_two() { List<Member> list =
	 * adminRep.selectCounselByMember(67L); list.forEach(i ->
	 * System.out.println(i)); }
	 */

	@Test
	void test_three() {
		Member member = adminRep.findById(67L).orElse(null);
		System.out.println(member);
		System.out.println(member.getTicketList());
	}

	/*
	 * @Test void test_four() { List<Integer> list =
	 * adminRep.countJoinMember2("21/06/12"); list.forEach(i ->
	 * System.out.println(i)); }
	 */

	@Test
	void test_five() {
		Map<String, Object> map = adminRep.countJoinMember3("21/06/13");
		System.out.println(map.get("DAY") + ", " + map.get("COUNT"));
	}

	@Test
	void test_six() {
		Map<String, Object> map = adminRep.countCounselByMonth("2021/05");
		System.out.println(map.get("MONTH") + ", " + map.get("COUNT"));
	}

	@Test
	void test_seven() {
		int randomTry = (int) (Math.random() * 100);

		List<Member> memberList = adminRep.findByMemberType(0);
		List<Counselor> counselors = counselorRep.findAll();

		for (int i = 0; i <= randomTry; i++) {
			int randomMonth = (int) (Math.random() * 6) + 6;
			int randomDay = (int) (Math.random() * 29) + 1;
			int randomHour = (int) (Math.random() * 24);
			int randomMinutes = (int) (Math.random() * 60);
			int randomPlusDays = (int) (Math.random() * 60);
			int randomCategory = (int) (Math.random() * 3);
			int randomMember = (int) (Math.random() * 22);
			int randomCounselor = (int) (Math.random() * 11);

			LocalDateTime counselReqDate = LocalDateTime.of(2021, 6, randomDay, randomHour, randomMinutes);
			LocalDateTime counselDate = counselReqDate.plusDays(randomPlusDays);
			counselRep.save(new Counsel(null, memberList.get(randomMember), counselors.get(randomCounselor),
					randomCategory, 3, counselReqDate, counselDate));
		}

	}

	@Test
	void test_eight() {
		List<Object> list = Arrays.asList(new String[] { "우울", "불안", "섭식장애", "청소년", "강박", "스트레스", "직장", "진로", "중독", "감정조절" });
		List<Counselor> counselors = counselorRep.findAll();

		for (Counselor counselor : counselors) {
			int randomTry = (int) (Math.random() * 5) + 1;
			for (int i = 1; i < randomTry; i++) {
				int randomSpec = (int) (Math.random() * list.size());
				specialityRep.save(new Speciality(null, String.valueOf(list.get(randomSpec)), counselor));
				list.remove(randomSpec);
			}
		list = Arrays.asList(new String[] { "우울", "불안", "섭식장애", "청소년", "강박", "스트레스", "직장", "진로", "중독", "감정조절" });
		
		}
	
	}

}
