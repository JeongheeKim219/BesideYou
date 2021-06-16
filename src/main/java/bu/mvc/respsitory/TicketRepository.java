package bu.mvc.respsitory;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Ticket;

public interface TicketRepository extends JpaRepository<Ticket, Long>{

	/**
	 * 1. 당일 상품권 매출 금액 조회
	 */
	List<Ticket> findByTicketDateBetween(LocalDateTime start, LocalDateTime end);
	
}
