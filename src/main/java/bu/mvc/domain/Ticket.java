package bu.mvc.domain;

import java.time.LocalDateTime;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Ticket {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ticket_code_seq")
	@SequenceGenerator(sequenceName = "ticket_code_seq", allocationSize = 1, name = "ticket_code_seq")
	private Long ticketCode; //상담권 코드
	private int ticketAmount; //상담권 수량
	private int ticketRemain; //상담권 잔여량
	
	@CreationTimestamp
	private LocalDateTime ticketDate; //상담권 구매일
	
	private int ticketField; //상담권 종류
	private int ticketPrice; //상담권 총 가격

	@ManyToOne
	@JoinColumn(name = "counselor_code") //상담사 코드
	private Counselor counselor;
	
	@ManyToOne
	@JoinColumn(name = "member_code") //회원 코드
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "discount_code") //할인코드
	private Discount discount;

	//상담권 코드만 인수로 받는 생성자
	public Ticket(Long ticketCode) {
		this.ticketCode = ticketCode;
	}
	
}
