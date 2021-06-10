package bu.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
public class ArtCounselor {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "art_counselor_seq")
	@SequenceGenerator(sequenceName = "art_counselor_seq", allocationSize = 1, name="art_counselor_seq")
	private Long artCounselorCode;
	
	private String question;
	private String detail;
	
	//private Long counselorCode;
}
