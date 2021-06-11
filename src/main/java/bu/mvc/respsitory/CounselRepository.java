package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Counsel;

public interface CounselRepository extends JpaRepository<Counsel, Long> {
	
}
