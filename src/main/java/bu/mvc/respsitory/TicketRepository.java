package bu.mvc.respsitory;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import java.time.LocalDateTime;
import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Ticket;

public interface TicketRepository extends JpaRepository<Ticket, Long>{

	Page<Ticket> findByMemberId(String id, Pageable pageable);

	/**
	 * 1. 당일 상품권 매출 금액 조회
	 */
	List<Ticket> findByTicketDateBetween(LocalDateTime start, LocalDateTime end);
	
}
