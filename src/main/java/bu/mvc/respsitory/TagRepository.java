package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Counselor;
import bu.mvc.domain.Tag;



public interface TagRepository extends JpaRepository<Tag, Long>{
	
	List<Tag> findByCounselor(Counselor counselor);
}

