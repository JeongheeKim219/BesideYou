package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;


import bu.mvc.domain.Speciality;


public interface SpecialityRepository extends JpaRepository<Speciality, Long>{

}