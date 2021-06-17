package bu.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import bu.mvc.domain.Counsel;
import bu.mvc.domain.Counselor;
import bu.mvc.domain.Ticket;
import bu.mvc.domain.TicketLines;
import bu.mvc.respsitory.CounselRepository;
import bu.mvc.respsitory.CounselorRepository;
import bu.mvc.respsitory.TicketLinesRepository;
import bu.mvc.respsitory.TicketRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class CounselServiceImpl implements CounselService {
	
	private final CounselorRepository counselorRepository;
	
	private final CounselRepository counselRepository;
	
	private final TicketRepository ticketRepository;
	
	private final TicketLinesRepository ticketLinesRepository;
	
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
	public void submit012(Counsel counsel) {
		Ticket ticket = ticketRepository.getRemainTicket(counsel.getMember().getMemberCode(), counsel.getCounselor().getCounselorCode(), counsel.getCounselCategory()).get(0);
		ticket.setTicketRemain(ticket.getTicketRemain()-1);
		
		TicketLines ticketLine = new TicketLines();
		ticketLine.setTicket(ticket);
		
		ticketLinesRepository.save(ticketLine);
		
		counselRepository.save(counsel);
	}

}
