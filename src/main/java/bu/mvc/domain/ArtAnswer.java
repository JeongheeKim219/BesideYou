package bu.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
@ToString
public class ArtAnswer {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "art_ans_seq")
	@SequenceGenerator(sequenceName = "art_ans_seq", allocationSize = 1, name = "art_ans_seq")
	private Long artAnsCode;
	
	private String artAnsContent;
	
	@CreationTimestamp
	private LocalDateTime artAnsDate;
	
	@OneToOne
	@JoinColumn(name = "art_code")
	private Art art;
}
