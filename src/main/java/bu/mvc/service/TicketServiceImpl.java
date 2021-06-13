package bu.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import bu.mvc.domain.Ticket;
import bu.mvc.domain.TicketLines;
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
	public List<Ticket> searchByAlias(String alias, Pageable pageable) {
		return ticketRepository.findByMemberAlias(alias, pageable);
	}

	@Override
	public Ticket selectByCode(Long ticketCode) {
		Ticket ticket = ticketRepository.findById(ticketCode).orElse(null);
		if(ticket==null) throw new RuntimeException(ticketCode+"번 코드에 해당하는 상담권 정보를 찾을 수 없습니다.");
		return ticket;
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
		
		//해당하는 상담권이 없거나 잔여량이 없을 경우
		if(ticket==null || remain<=0) {
			throw new RuntimeException("사용할 수 없는 상담권입니다.");
		}
		
		//상담권 잔여량이 있을 경우 잔여량 감소
		ticket.setTicketRemain(remain-1);
		ticketLinesRepository.save(new TicketLines(ticket)); //상담권 사용 내역에 저장
	}

	@Override
	public void delete(Long ticketCode) {
		Ticket ticket = ticketRepository.findById(ticketCode).orElse(null);
		
		if(ticket==null || ticket.getTicketRemain()>0) {
			throw new RuntimeException("존재하지 않는 상담권이거나 잔여량이 남은 상담권입니다.");
		}
		ticketRepository.deleteById(ticketCode);
	}

}
