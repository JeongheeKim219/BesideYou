package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.Refund;

public interface RefundRepository extends JpaRepository<Refund, Long>{

	List<Refund> findByTicketMemberId(String id, Pageable pageable);
	
	Refund findByTicketTicketCode(Long ticketCode);
	
	/*@Query("update Refund r set r.refundState = ?2 where r.refundCode = ?1")
	@Modifying
	void updateState(Long code, int state);*/
	
}
