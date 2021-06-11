package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Notice;

public interface NoticeRepository extends JpaRepository<Notice, Long> {

}
