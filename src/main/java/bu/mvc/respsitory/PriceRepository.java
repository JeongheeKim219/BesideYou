package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.Price;


public interface PriceRepository extends JpaRepository<Price, Long> {
	
	@Query("select p from Price p where p.counselor.counselorCode=?1")
	List<Price> searchByCode(Long counselorCode);
	
	@Query("delete from Price p where p.counselor.counselorCode=?1")
	@Modifying
	void deleteByCounselorCode(Long counselorCode);

}
