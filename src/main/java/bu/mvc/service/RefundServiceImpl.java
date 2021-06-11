package bu.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import bu.mvc.domain.Refund;
import bu.mvc.domain.Ticket;
import bu.mvc.respsitory.RefundRepository;
import bu.mvc.respsitory.TicketRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class RefundServiceImpl implements RefundService {

	private final RefundRepository refundRepository;
	private final TicketRepository ticketRepository;
	
	@Override
	public Page<Refund> selectAll(Pageable pageable) {
		return refundRepository.findAll(pageable);
	}

	@Override
	public List<Refund> searchBy(String id, Pageable pageable) {
		return refundRepository.findByTicketMemberIdLike(id, pageable);
	}

	@Override
	public Refund selectByCode(Long refundCode) {
		return refundRepository.findById(refundCode).orElse(null);
	}

	@Override
	public void insert(Refund refund) {
		refundRepository.save(refund);
	}
	
	//환불 처리
	@Override
	public void refundTicket(Long ticketCode) {
		Ticket ticket = ticketRepository.findById(ticketCode).orElse(null);
		
		//상담권 잔여량이 없을 경우
		if(ticket.getTicketRemain()<=0) {
			this.updateState(ticketCode, 1); //신청 내역 상태변경 : 환불 불가
			throw new RuntimeException("소진된 상담권은 환불할 수 없습니다.");
		}
		
		//상담권 잔여량이 있을 경우 잔여량을 '0'으로
		ticket.setTicketRemain(0);
		this.updateState(ticketCode, 2); //신청 내역 상태변경 : 환불 완료
		
	}

	//환불 신청 내역 상태 변경(0:처리중 / 1:환불불가 / 2:환불완료)
	@Override
	public void updateState(Long refundCode, int refundState) {
		Refund refund = refundRepository.findById(refundCode).orElse(null);
		refundRepository.updateState(refundCode, refundState);
	}

	@Override
	public void delete(Long refundCode) {
		refundRepository.deleteById(refundCode);
	}


}
