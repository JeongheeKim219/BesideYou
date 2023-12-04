package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Discount;

public interface DiscountRepository extends JpaRepository<Discount, Long>{

}
