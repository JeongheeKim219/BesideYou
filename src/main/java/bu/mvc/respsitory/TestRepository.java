package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.TestJPA;

public interface TestRepository extends JpaRepository<TestJPA, Long>{

}
