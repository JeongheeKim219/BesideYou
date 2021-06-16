package bu.mvc.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import bu.mvc.domain.Counsel;
import bu.mvc.domain.Counselor;
import bu.mvc.respsitory.CounselorRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class CounselServiceImpl implements CounselService {
	
	private final CounselorRepository counselorRepository;
	
	private final CounselorRepository counselRepository;
	
	
	@Override
	public Counselor getCounselor(Long counselorCode) {
		return counselorRepository.findById(counselorCode).orElse(null);
	}

	@Override
	public int getRemainTicket(Long counselorCode, Long memberCode, int ticketField) {
		return 0;
	}

	@Override
	public int submit012(Counsel counsel) {
		// TODO Auto-generated method stub
		return 0;
	}

}
