package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.Member;
import bu.mvc.domain.Psychology;

public interface PsychologyRepository extends JpaRepository<Psychology, Long> {

	/**
	 * 멤버코드에 해당하는 테스트 검색
	 * */
	@Query("select p from Psychology p where p.member=?1 order by p.testDate desc")
	Page<Psychology> seacrchPsyByMember(Member member, Pageable pageable);
	
	List<Psychology> findByMemberMemberCode(Long memberCode);
}
