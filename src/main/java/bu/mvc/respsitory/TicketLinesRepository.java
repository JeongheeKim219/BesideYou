package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.TicketLines;

public interface TicketLinesRepository extends JpaRepository<TicketLines, Long>{

}
