package bu.mvc.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import bu.mvc.domain.Counsel;
import bu.mvc.domain.Counselor;
import bu.mvc.domain.RequestAns;
import bu.mvc.domain.Requests;
import bu.mvc.respsitory.CounselRepository;
import bu.mvc.respsitory.CounselorRepository;
import bu.mvc.respsitory.RequestAnsRepository;
import bu.mvc.respsitory.RequestRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class RequestServiceImpl implements RequestService {
	
	private final CounselRepository counselRepository;
	
	private final RequestRepository requestRepository;
	
	private final RequestAnsRepository requestAnsRepository;
	
	@Override
	public Counsel getCounsel(Long counselCode) {
		return counselRepository.findById(counselCode).orElse(null);
	}

	@Override
	public Requests read(Counsel counsel) {
		return requestRepository.findByCounsel(counsel);
	}

	@Override
	public RequestAns getAnswer(Requests requests) {
		return requestAnsRepository.findByRequests(requests);
	}

	@Override
	public Requests getRequests(Long requestCode) {
		return requestRepository.findById(requestCode).orElse(null);
	}

	@Override
	public void addAns(RequestAns requestAns) {
		requestAnsRepository.save(requestAns);
		Long counselCode = requestAns.getRequests().getCounsel().getCounselCode();
		counselRepository.completeCounsel(counselCode);
	}
	

}
