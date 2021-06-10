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

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Counselor {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "counselor_seq")
	@SequenceGenerator(sequenceName = "counselor_seq",allocationSize = 1,name = "counselor_seq")
	private int counselorCode;
	private double latitude;
	private double longitude;
	private String career; //경력
	private String degree;//학위
	private String counselorAddr;
	private String cerificate;//자격증
	private String picture;
	private int counselorState;
	
	@ManyToOne
	private Member memberCode; // 회원코드
	
	
	
}
