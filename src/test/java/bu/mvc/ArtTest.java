package bu.mvc;

import java.util.List;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import bu.mvc.domain.Art;
import bu.mvc.domain.ArtAnswer;
import bu.mvc.domain.ArtCounselor;
import bu.mvc.domain.Counselor;
import bu.mvc.domain.Member;
import bu.mvc.domain.Psychology;
import bu.mvc.respsitory.ArtAnswerRepository;
import bu.mvc.respsitory.ArtCounselorRepository;
import bu.mvc.respsitory.ArtRepository;
import bu.mvc.respsitory.PsychologyRepository;

@SpringBootTest
@Transactional
@Commit
public class ArtTest {

	@Autowired
	private ArtRepository artRep;
	
	@Autowired
	private PsychologyRepository psyRep;
	
	@Autowired
	private ArtCounselorRepository acRep;
	
	@Autowired
	private ArtAnswerRepository ansRep;
	
	@Test
	void test() {
		System.out.println("artRep : "+artRep);
	}
	
	//테스트 실행
	@Test
	void testInsert() {
		//psyRep.save(new Psychology(null, 0, null, new Member(4L)));
		psyRep.save(new Psychology(null, 0, null, new Member(3L)));
	}

	//그림상담사 등록
	@Test
	void artCounselor() {
		//acRep.save(new ArtCounselor(null, "q", "d", new Counselor(1L)));
		acRep.save(new ArtCounselor(null, "지시사항", "검사항목", new Counselor(17L)));
	}
	
	//그림테스트 요청
	@Test
	void insert() {
		//artRep.save(new Art(null, null, "파일", 0, new Member(4L), new ArtCounselor(2L)));
		//artRep.save(new Art(null, null, "파일", 0, new Member(4L), new ArtCounselor(21L)));
		artRep.save(new Art(null, null, "파일", 0, new Member(3L), new ArtCounselor(21L)));
	}
	
	//그림테스트 답변
	@Test
	void answer() {
		//ansRep.save(new ArtAnswer(null, "답변", null, new Art(1L)));
		ansRep.save(new ArtAnswer(null, "답변", null, new Art(22L)));
	}
	
	//그림상담사 전체검색
	@Test
	void selectAll() {
		List<ArtCounselor> list= acRep.findAll();
		list.forEach(a->System.out.println(a));
	}
	
	//그림상담사 pk 대상으로 검색
	@Test
	void selectById() {
		ArtCounselor ac = acRep.findById(2L).orElse(null);
		System.out.println(ac);
	}
	
	//그림상담사를 대상으로 그림테스트요청검색
	@Test
	void selectByCounselor() {
		List<Art> list = artRep.searchByCounselor(new ArtCounselor(21L));
		System.out.println("개수 : "+list.size());
		list.forEach(a->System.out.println(a));
	}
	
	//멤버코드에 해당하는 그림테스트답변 검색
	@Test
	void selectAnswerByMember() {
		System.out.println("******************");
		List<ArtAnswer> list= ansRep.searchAnswerByMember(4L);
		
		System.out.println("-----------------------");
		System.out.println("개수 : "+list.size());
		list.forEach(a->System.out.println(a));
	}
	
	//멤버코드에 해당하는 테스트 검색
	@Test
	void selectPsyByMember() {
		List<Psychology> list = psyRep.seacrchPsyByMember(new Member(3L));
		System.out.println("개수 : "+list.size());
		list.forEach(a->System.out.println(a));
	}
	
	
}
