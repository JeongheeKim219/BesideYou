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
import bu.mvc.respsitory.CounselorRepository;
import bu.mvc.respsitory.MemberRepository;
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
	
	@Autowired
	private MemberRepository memRep;
	
	@Autowired
	private CounselorRepository cRep;
	
	@Test
	void test() {
		System.out.println("artRep : "+artRep);
	}
	
	//테스트 실행
	@Test
	void testInsert() {
		//psyRep.save(new Psychology(null, 0, null, new Member(4L)));
		//psyRep.save(new Psychology(null, 0, null, new Member(3L)));
		psyRep.save(new Psychology(null, 10, 0, null, new Member(4L)));
	}

	//그림상담사 등록
	@Test
	void artCounselor() {
		//acRep.save(new ArtCounselor(null, "q", "d", new Counselor(1L)));
		//acRep.save(new ArtCounselor(null, "준비물은 연필과 지우개입니다. 오래 생각하지 말고 그려주세요.", "1.비오는 날의 그림을 그려주세요. 2. 나무를 그려주세요.", new Counselor(25L)));
	}
	
	//그림테스트 요청
	@Test
	void insert() {
		//artRep.save(new Art(null, null, "파일", 0, new Member(4L), new ArtCounselor(2L), null));
		//artRep.save(new Art(null, null, "파일", 0, new Member(4L), new ArtCounselor(21L), null));
		artRep.save(new Art(null, null, "파일", 0, new Member(3L), new ArtCounselor(21L), null));
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
		//List<Psychology> list = psyRep.seacrchPsyByMember(new Member(3L));
		//System.out.println("개수 : "+list.size());
		//list.forEach(a->System.out.println(a));
	}
	
	//멤버코드에 해당하는 카운슬러코드 검색
	@Test
	void select() {
		//Member member = memRep.findById(4L).orElse(null);
		//System.out.println("member : "+member);
		//System.out.println("counselor : "+member);
		//cRep.findById(new Member(4L));
		Counselor co = cRep.searchBymembercode(4L);
		System.out.println("co :"+co);
	}
	
	//카운슬러코드에 해당하는 아트카운슬러 검색
	@Test
	void select1() {
		ArtCounselor ac = acRep.selectByCounselorCode(new Counselor(1L));
		System.out.println("ac : "+ac);
	}
	
	//멤버코드에 해당하는 그림요청 검색
	@Test
	void aa() {
		List<Art> list = artRep.searchByMem(4L);
		System.out.println("개수 : "+list.size());
		list.forEach(a->System.out.println(a));
	}
	
	
}
