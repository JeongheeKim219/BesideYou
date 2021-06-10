package bu.mvc.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@NoArgsConstructor
@Getter
@Setter
@Entity
public class Member {
	
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "MEMBER_ID_SEQ")
	@SequenceGenerator(sequenceName = "MEMBER_ID_SEQ", allocationSize = 1, name = "MEMBER_ID_SEQ")
	private Long memberSequence;
	
	private String code = "M";
	
	@Id
	private String memberCode = code + memberSequence;
	
	private String id; 
	private String password; 
	private String name; 
	private String alias; 
	private String addr; 
	private String phone; 
	private String email; 
	
	@Column(name = "date_of_birth")
	/* @Temporal(TemporalType.DATE) */
	private LocalDate dateOfBirth; 
	
	@Column(name = "date_of_reg")
	/* @Temporal(TemporalType.DATE) */
	private LocalDateTime dateOfReg;
	
	private int  state;
	private int  memberType;

	public Member(String memberCode, String id, String password, String name, String alias, String addr, String phone,
			String email, LocalDate dateOfBirth, LocalDateTime dateOfReg, int state, int memberType) {
		this.memberCode = memberCode;
		this.id = id;
		this.password = password;
		this.name = name;
		this.alias = alias;
		this.addr = addr;
		this.phone = phone;
		this.email = email;
		this.dateOfBirth = dateOfBirth;
		this.dateOfReg = dateOfReg;
		this.state = state;
		this.memberType = memberType;
	}
	
	
	
}
