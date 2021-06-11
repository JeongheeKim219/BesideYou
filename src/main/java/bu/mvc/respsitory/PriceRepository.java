package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Price;

public interface PriceRepository extends JpaRepository<Price, Long> {

}
