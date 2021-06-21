package bu.mvc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
public class Authority {
	
	
	@Id 
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "authority_seq")
	@SequenceGenerator(sequenceName = "authority_seq",allocationSize = 1,name = "authority_seq")
	@Column(name="authority_code")
	private Long authorityCode;
	
	@ManyToOne
	@JoinColumn(name="member_code")
	private Member member;
	
	private String role;
}
