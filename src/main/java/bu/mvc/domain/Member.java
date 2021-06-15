package bu.mvc.domain;



import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
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
public class Member {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "member_seq")
	@SequenceGenerator(sequenceName = "member_seq",allocationSize = 1,name = "member_seq")
	private Long memberCode;
	private String id;
	private String password;
	private String name;
	private String alias; //가명
	private String memberAddr;
	private String phone;
	private String email;
	private int memberState;
	private int memberType;
	
	private LocalDate dateOfBirth;//생년월일
	
	@CreationTimestamp
	private LocalDateTime dateOfReg;//가입일

	//6.13추가 조인을 위한 관계 매핑
	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL)
	private List<Counsel> counselList; //상담내역
	
	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL)
	private List<Ticket> ticketList; //상담권 내역
	
	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL)
	private List<Contact> contactList; //문의  내역 
	
	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL)
	private List<ReviewStar> reviewStarsList;
	
	
	public Member(Long memberCode) {
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
