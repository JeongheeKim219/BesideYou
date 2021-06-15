package bu.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bu.mvc.domain.Art;
import bu.mvc.domain.ArtCounselor;
import bu.mvc.domain.Psychology;
import bu.mvc.respsitory.ArtCounselorRepository;
import bu.mvc.respsitory.ArtRepository;
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
	
	@Override
	public void testInsert(Psychology psychology) {
		// TODO Auto-generated method stub
		psyRepository.save(psychology);
	}

	@Override
	public List<ArtCounselor> selectArtCounselor() {
		// TODO Auto-generated method stub
		List<ArtCounselor> list= acRepository.findAll();
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
	public Psychology selectByCode(Long testCode) {
		// TODO Auto-generated method stub
		Psychology psy = psyRepository.findById(testCode).orElse(null);
		return psy;
	}

}
