package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.ArtAnswer;
import bu.mvc.domain.Member;

public interface ArtAnswerRepository extends JpaRepository<ArtAnswer, Long> {

	/**
	 * art에 있는 멤버코드에 해당하는 artanswer 그림테스트답변 검색
	 * */
	@Query("select a from ArtAnswer a inner join Art b on a.art.artCode = b.artCode  where b.member.memberCode=?1")
	List<ArtAnswer> searchAnswerByMember(Long member);
}
