package bu.mvc.domain;



import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
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

@ToString
@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Counselor {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "counselor_seq")
	@SequenceGenerator(sequenceName = "counselor_seq",allocationSize = 1,name = "counselor_seq")
	@Column(name = "counselor_code")
	private Long counselorCode;
	private double latitude;
	private double longitude;
	private String career; //경력
	private String degree;//학위
	@Column(name= "counselor_addr")
	private String counselorAddr;
	private String cerificate;//자격증
	private String picture;
	@Column(name="counselor_state")
	private int counselorState;
	

	@OneToMany(mappedBy = "counselor", cascade = CascadeType.ALL)
	private List<Speciality> speciality;

	@OneToOne
	@JoinColumn(name="member_code")
	private Member member; // 회원코드
	
	
	//List<ReviewStar> reviewStars
	
	
	public Counselor(Long counselorCode) {
		super();
		this.counselorCode = counselorCode;
	}
	
	
	
}
