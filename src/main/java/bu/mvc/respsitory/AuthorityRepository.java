package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Authority;
import bu.mvc.domain.Member;




public interface AuthorityRepository extends JpaRepository<Authority, Long>{
	
	List<Authority> findByMember(Member member);
    
}