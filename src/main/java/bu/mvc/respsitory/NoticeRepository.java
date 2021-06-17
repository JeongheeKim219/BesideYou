package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.Notice;

public interface NoticeRepository extends JpaRepository<Notice, Long> {
	
	/**
	 * 조회수 증가하기
	 * */
	@Query("update Notice n set n.noticeNum = n.noticeNum+1 where n.noticeCode = ?1")
	@Modifying
	void readnumUpdate(Long noticeCode);

}
