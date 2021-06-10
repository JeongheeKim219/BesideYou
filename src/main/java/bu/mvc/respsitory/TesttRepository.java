package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Test;

public interface TesttRepository extends JpaRepository<Test, Long> {

}
