package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.Authority;
import bu.mvc.domain.Member;




public interface AuthorityRepository extends JpaRepository<Authority, Long>{
	
	 /**
     * 권한
     * */
		
		 @Query("select a.role from Authority a where a.member.memberCode=?1") 
		 List<String> selectAuthority(Long memberCode);
		 
    
}