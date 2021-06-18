package bu.mvc.respsitory;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.Contact;

public interface ContactRepository extends JpaRepository<Contact, Long> {
	
	@Query("update Contact c set c.contactState=1 where c.contactCode in (select r.contact.contactCode from  ContactReply r where r.contactReplyContent is not null)")
	@Modifying
	void stateUpdate();
	
	
	Page<Contact> findByMemberMemberCode(Pageable pageable, Long memberCode);
	
	
}
