package bu.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

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
//@ToString
public class Art {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "art_seq")
	@SequenceGenerator(sequenceName = "art_seq",allocationSize = 1, name = "art_seq")
	private Long artCode;
	
	@CreationTimestamp
	private LocalDateTime artDate;
	private String artFile;
	private int artState;
	
	@ManyToOne
	@JoinColumn(name = "member_code")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "art_counselor_code")
	private ArtCounselor artCounselor;

	@OneToOne(mappedBy = "art")
	private ArtAnswer artAnswer;
	
	public Art(Long artCode) {
		super();
		this.artCode = artCode;
	}
	
	

	

}
