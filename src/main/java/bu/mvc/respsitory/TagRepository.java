package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Tag;



public interface TagRepository extends JpaRepository<Tag, Long>{

}

