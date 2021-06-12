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
		Refund refund = refundRepository.findById(refundCode).orElse(null);
		if(refund==null) throw new RuntimeException(refundCode+"번 코드에 해당하는 환불 신청 내역이 존재하지 않습니다.");
		return refund;
	}

	@Override
	public void insert(Refund refund) {
		refund.setRefundState(0);
		refundRepository.save(refund);
	}
	
	//환불 처리
	@Override
	public void refundTicket(Refund refund) {
		Ticket ticket = ticketRepository.findById(refund.getTicket().getTicketCode()).orElse(null);
		
		if(ticket==null) { //코드에 해당하는 상담권이 없을 때
			throw new RuntimeException("상담권 정보가 존재하지 않습니다.");
		}else if(ticket.getTicketRemain()<=0) { //상담권 잔여량이 없을 경우
			refund.setRefundState(1); //신청 내역 상태변경 : 환불 불가
			throw new RuntimeException("소진된 상담권은 환불할 수 없습니다.");
		}else {
			ticket.setTicketRemain(0); //상담권 잔여량이 있을 경우 잔여량을 '0'으로
			refund.setRefundState(2); //신청 내역 상태변경 : 환불 완료
		}
	}

	@Override
	public void delete(Long refundCode) {
		refundRepository.deleteById(refundCode);
	}


}
