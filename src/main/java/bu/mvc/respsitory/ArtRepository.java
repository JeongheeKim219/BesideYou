package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Art;

public interface ArtRepository extends JpaRepository<Art, Long> {

}
