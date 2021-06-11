package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.ContactReply;

public interface ContactReplyRepository extends JpaRepository<ContactReply, Long> {

}
