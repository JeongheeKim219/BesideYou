package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.ReviewStar;

public interface ReviewRepository extends JpaRepository<ReviewStar, Long> {

}
