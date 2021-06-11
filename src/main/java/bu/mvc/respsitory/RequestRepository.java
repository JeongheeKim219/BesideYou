package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Counsel;
import bu.mvc.domain.Requests;

public interface RequestRepository extends JpaRepository<Requests, Long> {
	
}
