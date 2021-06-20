package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.Ticket;

public interface TicketRepository extends JpaRepository<Ticket, Long> {

	@Query("select t from Ticket t where t.member.memberCode=?1 and t.counselor.counselorCode=?2 and t.ticketField=?3 and t.ticketRemain!=0 order by ticketDate")
	List<Ticket> getRemainTicket(Long memberCode, Long counselorCode, int ticketField);

	Page<Ticket> findByMemberId(String id, Pageable pageable);

	/**
	 * 1. 당일 상품권 매출 금액 조회
	 */
	List<Ticket> findByTicketDateBetween(LocalDateTime start, LocalDateTime end);

	/**
	 * 2. 전체 상품권 매출 조회
	 */
	Page<Ticket> findAll(Pageable pageable);

	List<Ticket> findByMemberMemberCode(Long memberCode);

	Page<Ticket> findByMemberMemberCode(Pageable pageable, Long memberCode);
	

}