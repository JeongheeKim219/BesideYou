package bu.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

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
public class Counsel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "counsel_seq")
	@SequenceGenerator(sequenceName = "counsel_seq",allocationSize = 1, name = "counsel_seq")
	private Long counselCode;
	
	@ManyToOne
	@JoinColumn(name = "member_code")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "COUNSELOR_CODE")
	private Counselor counselor;
	
	private int counselCategory;
	private int counselState;

	@CreationTimestamp
	private LocalDateTime counselReqDate;
	
	private LocalDateTime counselDate;
	

	public Counsel(Long counselCode) {
		this.counselCode = counselCode;
	}
	


	public Counsel(Long counselCode, Member member, Counselor counselor, int counselCategory, int counselState,
			LocalDateTime counselDate) {
		this.counselCode = counselCode;
		this.member = member;
		this.counselor = counselor;
		this.counselCategory = counselCategory;
		this.counselState = counselState;
		this.counselDate = counselDate;
	}
	
	
}
