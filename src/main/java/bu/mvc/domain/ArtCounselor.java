package bu.mvc.domain;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ArtCounselor {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "art_counselor_seq")
	@SequenceGenerator(sequenceName = "art_counselor_seq", allocationSize = 1, name="art_counselor_seq")
	private Long artCounselorCode;
	
	private String question;
	private String detail;
	
	@OneToOne
	@JoinColumn(name = "counselor_code")
	private Counselor counselor;
	

	public ArtCounselor(Long artCounselorCode) {
		super();
		this.artCounselorCode = artCounselorCode;
	}

	
	
	
	
}
