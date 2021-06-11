package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Ticket;

public interface TicketRepository extends JpaRepository<Ticket, Long>{

	List<Ticket> findByMemberIdContaining(String id, Pageable pageable);
}
