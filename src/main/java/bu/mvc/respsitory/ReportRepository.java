package bu.mvc.respsitory;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Report;

public interface ReportRepository extends JpaRepository<Report, Long> {

	
}
