package bu.mvc.domain;

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

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Tag {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "tag_seq")
	@SequenceGenerator(sequenceName = "tag_seq",allocationSize = 1,name = "tag_seq")
	private Long tagCode;
	private String tagName;
	
	@ManyToOne
	private Counselor counselorCode;
}
