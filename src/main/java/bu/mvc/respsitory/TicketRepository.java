package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.Ticket;

public interface TicketRepository extends JpaRepository<Ticket, Long>{
	@Query("select t from Ticket t where t.member.memberCode=?1 and t.counselor.counselorCode=?2 and t.ticketField=?3 and t.ticketRemain!=0 order by ticketDate")
	List<Ticket> getRemainTicket(Long memberCode, Long counselorCode, int ticketField);
	
}
