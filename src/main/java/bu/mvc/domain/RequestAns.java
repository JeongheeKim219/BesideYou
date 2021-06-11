package bu.mvc.domain;

import java.util.Date;

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
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class RequestAns {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "request_seq")
	@SequenceGenerator(sequenceName = "request_seq",allocationSize = 1, name = "request_seq")	
	private Long ansCode;
	
	private Long requestCode;
	
	private Long counselorCode;
	
	private String ansContent;
	
	private Date ansDate;
	
	
}
