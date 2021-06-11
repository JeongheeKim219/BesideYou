package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Refund;

public interface RefundRepository extends JpaRepository<Refund, Long>{

}
