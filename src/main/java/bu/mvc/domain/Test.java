package bu.mvc.domain;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Test {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "test_code_seq")
	@SequenceGenerator(sequenceName = "test_code_seq", allocationSize = 1, name="test_code_seq")
	private Long testCode;
	
	private int total;
	private LocalDate testDate;
	
	@ManyToOne
	private Member member;
}
