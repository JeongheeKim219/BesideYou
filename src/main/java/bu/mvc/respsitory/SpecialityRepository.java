package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.Counselor;
import bu.mvc.domain.Speciality;


public interface SpecialityRepository extends JpaRepository<Speciality, Long>{

			
	@Query("select s from Speciality s where s.counselorCode=?1")
	Speciality searchByCode(Long counselor);
	
	
}