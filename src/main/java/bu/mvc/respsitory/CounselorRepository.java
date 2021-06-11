package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Counselor;


public interface CounselorRepository extends JpaRepository<Counselor, Long>{

}
