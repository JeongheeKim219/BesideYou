package bu.mvc;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import bu.mvc.domain.Member;
import bu.mvc.respsitory.AdminRepository;

@Commit
@Transactional
@SpringBootTest
public class AdminTest {

	@Autowired
	private AdminRepository adminRep;
	
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

	
	@Test
	void test_four() {
		List<Integer> list = adminRep.countJoinMember2("21/06/12");
		list.forEach(i -> System.out.println(i));
	}
	
	@Test
	void test_five() {
		Map<String, Object> map = adminRep.countJoinMember3("21/06/13");
		System.out.println(map.get("DAY") + ", " + map.get("COUNT"));
	}
	
}
