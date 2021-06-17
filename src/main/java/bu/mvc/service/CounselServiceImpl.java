package bu.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import bu.mvc.domain.Counsel;
import bu.mvc.domain.Counselor;
import bu.mvc.domain.Ticket;
import bu.mvc.respsitory.CounselorRepository;
import bu.mvc.respsitory.TicketRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class CounselServiceImpl implements CounselService {
	
	private final CounselorRepository counselorRepository;
	
	private final CounselorRepository counselRepository;
	
	private final TicketRepository ticketRepository;
	
	@Override
	public Counselor getCounselor(Long counselorCode) {
		return counselorRepository.findById(counselorCode).orElse(null);
	}

	@Override
	public int getRemainTicket(Long counselorCode, Long memberCode, int ticketField) {
		int sum = 0;
		List<Ticket> list = ticketRepository.getRemainTicket(memberCode, counselorCode, ticketField);
		for(Ticket t : list) {
			sum+= t.getTicketRemain();
		}
		return sum;
	}

	@Override
	public int submit012(Counsel counsel) {
		
		return 0;
	}

}
