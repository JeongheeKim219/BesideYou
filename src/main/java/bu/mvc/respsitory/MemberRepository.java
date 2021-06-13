package bu.mvc.respsitory;



import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;


import bu.mvc.domain.Member;

public interface MemberRepository extends JpaRepository<Member, Long>{
	
	
    Member findById(String id);
}
