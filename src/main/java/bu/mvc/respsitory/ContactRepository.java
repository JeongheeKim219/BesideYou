package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Contact;

public interface ContactRepository extends JpaRepository<Contact, Long> {

}
