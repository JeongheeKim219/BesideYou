package bu.mvc.domain;



import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
//@ToString
public class Member {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "member_seq")
	@SequenceGenerator(sequenceName = "member_seq",allocationSize = 1,name = "member_seq")
	@Column(name="member_code")
	private Long memberCode;
	@Column(name= "id",unique = true )
	private String id;
	private String password;
	/*
	 * @Transient private String passwordConfirm;//비밀번호 확인
	 */	
	private String name;
	private String alias; //가명
	@Column(name = "member_addr")
	private String memberAddr;
	
	private String phone;
	private String email;
	@Column(name = "member_state")
	private int memberState;
	@Column(name = "member_type")
	private int memberType;
	
	@Column(name ="DATE_OF_BIRTH")
	private LocalDate dateOfBirth;//생년월일
	
	@Transient 
	private String beforeDateOfBirth;
	
	@CreationTimestamp
	@Column(name ="DATE_OF_REG")
	private LocalDateTime dateOfReg;//가입일
	
	

	public Member(Long memberCode) {
		super();
		this.memberCode = memberCode;

	}


	
	public Member(Long memberCode, String id, String password, String name, String alias, String memberAddr,
			String phone, String email, int memberState, int memberType, LocalDate dateOfBirth) {
		this.memberCode = memberCode;
		this.id = id;
		this.password = password;
		this.name = name;
		this.alias = alias;
		this.memberAddr = memberAddr;
		this.phone = phone;
		this.email = email;
		this.memberState = memberState;
		this.memberType = memberType;
		this.dateOfBirth = dateOfBirth;


	}
	
	
	
}
