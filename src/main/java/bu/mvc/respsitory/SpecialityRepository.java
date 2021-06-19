package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Counselor;
import bu.mvc.domain.Speciality;


public interface SpecialityRepository extends JpaRepository<Speciality, Long>{
	
	List<Speciality> findByCounselor(Counselor counselorCode);
}