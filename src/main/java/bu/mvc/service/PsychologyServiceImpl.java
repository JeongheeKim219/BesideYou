package bu.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

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
import bu.mvc.respsitory.PsychologyRepository;
@Service
@Transactional
public class PsychologyServiceImpl implements PsychologyService {

	@Autowired
	private PsychologyRepository psyRepository;
	
	@Autowired
	private ArtCounselorRepository acRepository;
	
	@Autowired
	private ArtRepository artRepository;
	
	@Autowired
	private CounselorRepository coRepository;
	
	@Autowired
	private ArtAnswerRepository asRepository;
	
	@Override
	public void testInsert(Psychology psychology) {
		// TODO Auto-generated method stub
		psyRepository.save(psychology);
	}

	@Override
	public Page<ArtCounselor> selectArtCounselor(Pageable pageable) {
		// TODO Auto-generated method stub
		Page<ArtCounselor> list= acRepository.selectByArtCounselorState(pageable);
		return list;
	}

	@Override
	public ArtCounselor selectById(Long id) {
		// TODO Auto-generated method stub
		ArtCounselor ac = acRepository.findById(id).orElse(null);
		return ac;
	}

	@Override
	public void artInsert(Art art) {
		// TODO Auto-generated method stub
		artRepository.save(art);
	}

	@Override
	public void signup(ArtCounselor artCounselor) {
		// TODO Auto-generated method stub
		acRepository.save(artCounselor);
	}
	
	@Override
	public Counselor selectByMem(Long id) {
		// TODO Auto-generated method stub
		Counselor co = coRepository.searchBymembercode(id);
		if(co==null) {
			throw new RuntimeException("상담사로 등록되어있지 않습니다.");
		}
		return co;
	}
	
	@Override
	public Psychology selectByCode(Long testCode) {
		// TODO Auto-generated method stub
		Psychology psy = psyRepository.findById(testCode).orElse(null);
		return psy;
	}

	/*
	 * @Override public List<Art> selectByCounselor(ArtCounselor artCounselor) { //
	 * TODO Auto-generated method stub List<Art> list =
	 * artRepository.searchByCounselor(artCounselor); return list; }
	 */
	
	@Override
	public List<Art> selectByCounselor(Counselor co) {
		// TODO Auto-generated method stub
		System.out.println("co.getCounselorCode() = "+co.getCounselorCode());
		ArtCounselor ac = acRepository.selectByCounselorCode(co);
		if(ac==null) {
			throw new RuntimeException("그림상담사로 등록되어있지 않습니다.");
		}
		List<Art> list= artRepository.searchByCounselor(ac);
		return list;
	}

	@Override
	public ArtCounselor selectByCounselorCode(Counselor co) {
		// TODO Auto-generated method stub
		ArtCounselor ac = acRepository.selectByCounselorCode(co);
		return ac;
	}

	@Override
	public Art selectByArtCode(Long artCode) {
		// TODO Auto-generated method stub
		Art art = artRepository.findById(artCode).orElse(null);
		return art;
	}

	@Override
	public void insertAnswer(Long artCode, String artAnsContent) {
		// TODO Auto-generated method stub
		//art_answer insert
		asRepository.save(new ArtAnswer(null, artAnsContent, null, new Art(artCode)));
		//art -> art_state update
		Art art = artRepository.findById(artCode).orElse(null);
		art.setArtState(1);
	}

	@Override
	public List<ArtAnswer> selectAnswer(Long member) {
		// TODO Auto-generated method stub
		List<ArtAnswer> list = asRepository.searchAnswerByMember(member);
		return list;
	}

	@Override
	public List<Art> selectArt(Long member) {
		// TODO Auto-generated method stub
		List<Art> list = artRepository.searchByMem(member);
		return list;
	}

	@Override
	public Page<Psychology> selectResult(Member member, Pageable pageable) {
		// TODO Auto-generated method stub
		Page<Psychology> list = psyRepository.seacrchPsyByMember(member, pageable);
		return list;
	}

	@Override
	public void updateQD(Long code, ArtCounselor artCounselor) {
		// TODO Auto-generated method stub
		//멤버코드로 -> 카운슬러 -> 아트카운슬러 찾아서 그 뭐냐
		Counselor co= coRepository.searchBymembercode(code);
		ArtCounselor ac = acRepository.selectByCounselorCode(co);
		ac.setQuestion(artCounselor.getQuestion());
		ac.setDetail(artCounselor.getDetail());
		ac.setArtCounselorState(0);
	}

	@Override
	public void updateState(Long code) {
		// TODO Auto-generated method stub
		Counselor co= coRepository.searchBymembercode(code);
		ArtCounselor ac = acRepository.selectByCounselorCode(co);
		ac.setArtCounselorState(1);
	}

	
	
	

	

	

}
