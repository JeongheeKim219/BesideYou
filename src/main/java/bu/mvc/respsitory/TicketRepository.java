package bu.mvc.respsitory;


import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Ticket;

public interface TicketRepository extends JpaRepository<Ticket, Long>{

	/**
	 * 1. 당일 상품권 매출 금액 조회
	 */
	List<Ticket> findByTicketDateBetween(LocalDateTime start, LocalDateTime end);
	
	/**
	 * 2. 전체 상품권 매출 조회
	 */
	Page<Ticket> findAll(Pageable pageable);
	
}
