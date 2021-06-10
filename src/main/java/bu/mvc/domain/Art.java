package bu.mvc.domain;

import java.time.LocalDate;

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
public class Art {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "art_seq")
	@SequenceGenerator(sequenceName = "art_seq", allocationSize = 1, name = "art_seq" )
	private Long artCode;
	
	private LocalDate artDate;
	private String artFile;
	private int artState;
	
	private Long memberCode;
	
	//private Long artCounselorCode;
	private ArtCounselor artCounselor;
}
