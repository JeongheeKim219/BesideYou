package bu.mvc;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import bu.mvc.domain.Counsel;
import bu.mvc.respsitory.CounselRepository;

@Commit
@Transactional
@SpringBootTest
public class AdminTest {

	@Autowired
	private CounselRepository counselRep;
	
	
	
	
}
