package bu.mvc.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@NoArgsConstructor
@Getter
@Setter
public class TestJPA {
	
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "TEST_SEQ")
	@SequenceGenerator(sequenceName = "TEST_SEQ", allocationSize = 1, name =
	"TEST_SEQ")
	private Long memberSequence;
	
	
	private String code = "M";
	 
	
	@Id 
	private String memberCode = code + String.valueOf(memberSequence);
	 
	
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
	public TestJPA(String memberCode, String id, String password, String name, String alias, String addr, String phone,
			String email, LocalDate dateOfBirth, LocalDateTime dateOfReg, int state, int memberType) {
		super();
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
