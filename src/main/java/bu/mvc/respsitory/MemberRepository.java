package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Member;

public interface MemberRepository extends JpaRepository<Member, Long>{

}
