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
@Setter
@Getter
@NoArgsConstructor 
@AllArgsConstructor
public class Counsel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "counsel_seq")
	@SequenceGenerator(sequenceName = "counsel_seq",allocationSize = 1, name = "counsel_seq")
	private Long counselCode;
	
	
	private Long memberCode;
	
	private Long counselorCode;
	
	private int counselCategory;
	private int counselState;
	private LocalDateTime counselReqDate;
	private LocalDateTime counselDate;
	
}
