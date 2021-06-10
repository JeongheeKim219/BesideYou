package bu.mvc.domain;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
@Entity
public class Member {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "member_seq")
	@SequenceGenerator(sequenceName = "member_seq",allocationSize = 1,name = "member_seq")
	private Long memberCode;
	private String id;
	private String password;
	private String name;
	private String alias; //가명
	private String member_addr;
	private String phone;
	private String email;
	private int state;
	private int member_type;
	
	private LocalDate dateOfBirth;//생년월일
	
	private Date dateOfRegDate;//가입일
		public Member(Long memberCode, String id, String password, String name, String alias, String addr, String phone,
			String email, int state, LocalDate dateOfBirth, Date dateOfSign) {
		this.memberCode = memberCode;
		this.id = id;
		this.password = password;
		this.name = name;
		this.alias = alias;
		this.addr = addr;
		this.phone = phone;
		this.email = email;
		this.state = state;
		this.dateOfBirth = dateOfBirth;
		this.dateOfSign = dateOfSign;
	}


}
