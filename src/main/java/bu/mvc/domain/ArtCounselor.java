package bu.mvc.domain;

import javax.persistence.Entity;
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
@Entity
public class ArtCounselor {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "artcounselor_seq")
	@SequenceGenerator(sequenceName = "artcounselor_seq", allocationSize = 1, name = "artcounselor_seq")
	private Long artCounselorCode;
	
	private String question;
	private String detail;
	
	private Long counselorCode;
}
