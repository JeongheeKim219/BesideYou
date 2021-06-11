package bu.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import bu.mvc.domain.Ticket;
import bu.mvc.domain.TicketLines;
import bu.mvc.respsitory.RefundRepository;
import bu.mvc.respsitory.TicketLinesRepository;
import bu.mvc.respsitory.TicketRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class TicketServiceImpl implements TicketService {
	
	private final TicketRepository ticketRepository;
	private final TicketLinesRepository ticketLinesRepository;

	@Override
	public Page<Ticket> selectAll(Pageable pageable) {
		return ticketRepository.findAll(pageable);
	}

	@Override
	public List<Ticket> searchById(String id, Pageable pageable) {
		return ticketRepository.findByMemberIdLike(id, pageable);
	}

	@Override
	public Ticket selectByCode(Long ticketCode) {
		return ticketRepository.findById(ticketCode).orElse(null);
	}

	@Override
	public void insert(Ticket ticket) {
		ticketRepository.save(ticket);
	}
	
	//상담권 사용하기(잔여량 -1)
	@Override
	public void useTicket(Long ticketCode) {
		Ticket ticket = ticketRepository.findById(ticketCode).orElse(null);
		int remain = ticket.getTicketRemain(); //검색된 상담권의 현재 잔여량
		
		//상담권 잔여량이 없을 경우
		if(ticket.getTicketRemain()<=0) {
			throw new RuntimeException("잔여량이 없어 사용할 수 없습니다.");
		}
		
		//상담권 잔여량이 있을 경우 잔여량 감소
		ticket.setTicketRemain(remain-1);
		ticketLinesRepository.save(new TicketLines(ticket)); //상담권 사용 내역에 저장
	}

	@Override
	public void delete(Long ticketCode) {
		ticketRepository.deleteById(ticketCode);
	}

}
