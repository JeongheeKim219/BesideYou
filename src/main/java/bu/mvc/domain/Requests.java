package bu.mvc.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
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
public class Requests {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "request_seq")
	@SequenceGenerator(sequenceName = "request_seq",allocationSize = 1, name = "request_seq")
	private Long requestCode;
	
	@OneToOne
	@JoinColumn(name = "COUNSEL_CODE")
	private Counsel counsel;
	
	private String requestTitle;
	
	private int requestCategory;
	
	private String requestContent;

	public Requests(Long requestCode) {
		this.requestCode = requestCode;
	}
	
}
