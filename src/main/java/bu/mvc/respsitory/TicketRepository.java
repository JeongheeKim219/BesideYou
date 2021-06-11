package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Ticket;

public interface TicketRepository extends JpaRepository<Ticket, Long>{

}
