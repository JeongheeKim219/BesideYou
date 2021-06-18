package bu.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bu.mvc.domain.Counselor;
import bu.mvc.respsitory.CounselorRepository;

@Service
@Transactional
public class CounselorServiceImpl implements CounselorService {

	@Autowired
	private CounselorRepository counselorRep;
	@Override
	public void joinCounselor(Counselor counselor) {
		counselorRep.save(counselor);
		
	}

}
