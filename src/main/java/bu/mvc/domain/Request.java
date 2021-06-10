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

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Request {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "request_seq")
	@SequenceGenerator(sequenceName = "request_seq",allocationSize = 1, name = "request_seq")
	private Long requestCode;
	
	private Long counselCode;
	
	private String requestTitle;
	
	private int requestCategory;
	
	private String requestContent;
}
