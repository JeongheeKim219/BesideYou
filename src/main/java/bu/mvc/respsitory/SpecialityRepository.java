package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import bu.mvc.domain.Speciality;

@Repository
public interface SpecialityRepository extends JpaRepository<Speciality, Long>{
	
}