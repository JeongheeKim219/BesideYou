package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Faq;

public interface FaqRepository extends JpaRepository<Faq, Long> {

}
