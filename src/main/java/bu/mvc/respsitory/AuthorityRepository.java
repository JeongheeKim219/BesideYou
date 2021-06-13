package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Authority;




public interface AuthorityRepository extends JpaRepository<Authority, Long>{
	
	List<Authority> selectAuthorityByUserName(int memberCode);
    
}