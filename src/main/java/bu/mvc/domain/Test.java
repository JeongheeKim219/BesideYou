package bu.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Test {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "test_code_seq")
	@SequenceGenerator(sequenceName = "test_code_seq", allocationSize = 1, name = "test_code_seq")
	private Long testCode;
	
	private int total;
	private LocalDateTime testDate;
	
	private Long memberCode;
}
