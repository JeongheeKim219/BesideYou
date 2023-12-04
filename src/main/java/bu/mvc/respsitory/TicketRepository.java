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
	
	
	/**
	 * 3_1. 기간별 매출 조회(차트용)
	 */
	@Query("select t from Ticket t where t.ticketDate between to_date(?1, 'yyyy-mm-dd') and to_date(?2, 'yyyy-mm-dd')")
	List<Ticket> selectTicketBetween(String from, String to);

	/**
	 * 3_2. 기간별 매출 조회(페이징)
	 * @param pageable
	 * @param from
	 * @param to
	 * @return
	 */
	@Query("select t from Ticket t where t.ticketDate between to_date(?1, 'yyyy-mm-dd') and to_date(?2, 'yyyy-mm-dd')")
	Page<Ticket> selectTicketBetween(Pageable pageable, String from, String to);
	
	/**
	 * 4. 해당 월 매출 조회 
	 */
	
	@Query("select t from Ticket t where to_char(t.ticketDate, 'yyyy/mm') = ?1")
	List<Ticket> selectTicketThisMonth(String month);
	
	
	
	
	
}