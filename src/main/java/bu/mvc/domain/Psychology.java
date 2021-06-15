package bu.mvc.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Psychology {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "test_code_seq")
	@SequenceGenerator(sequenceName = "test_code_seq", allocationSize = 1, name="test_code_seq")
	private Long testCode;
	
	private int total;
	private int testName;
	@CreationTimestamp
	private LocalDateTime testDate;
	
	@ManyToOne
	@JoinColumn(name = "member_code")
	private Member member;
}
