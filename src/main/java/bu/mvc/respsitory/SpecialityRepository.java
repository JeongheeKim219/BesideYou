package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.Counselor;
import bu.mvc.domain.Speciality;


public interface SpecialityRepository extends JpaRepository<Speciality, Long>{

			
	@Query("select s from Speciality s where s.counselor.counselorCode=?1")
	List<Speciality> searchByCode(Long counselorCode);
	
	@Query("delete from Speciality s where s.counselor.counselorCode=?1")
	@Modifying
	void deleteByCounselorCode(Long counselorCode);
	
	
	//@Query("select s from Speciality s where s.specialityCode=?1")
	//List<Speciality> searchByspecialityCode(Long specialityCode);
	
	
	//@Query("update Speciality s set s.specialityName=?1 where s.counselor.counselorCode=?2")
	//@Modifying
	//void updateCode(String specialityName,Long counselorCode);
	
	
	//@Query("select s from Speciality s where s.counselorCode.counselorCode=?1")
	//Speciality searchBySpcCode(Long counselorCode);
}