package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.bind.annotation.ModelAttribute;

import bu.mvc.domain.Tag;



public interface TagRepository extends JpaRepository<Tag, Long>{
	
	@Query("select t from Tag t where t.counselor.counselorCode=?1")
	List<Tag> searchByCode(Long counselorCode);
	
	@Query("delete from Tag t where t.counselor.counselorCode=?1")
	@Modifying
	void deleteByCounselorCode(Long counselorCode);
}

