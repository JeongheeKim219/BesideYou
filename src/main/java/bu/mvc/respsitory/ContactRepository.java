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


	/**
	 * 1. 미처리 문의 조회
	 */
	List<Contact> findAllByContactState(int state);
	
	/**
	 * 2. 문의 내역 검색(+페이징)
	 */
	Page<Contact> findAll(Pageable pageable);

	
	
	Page<Contact> findByMemberMemberCode(Pageable pageable, Long memberCode);
	List<Contact> findByMemberMemberCode(Long memberCode);
	
	
}
