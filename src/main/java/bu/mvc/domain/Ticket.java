package bu.mvc.domain;

import java.time.LocalDateTime;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
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
	private Counselor counselorCode; //상담사 코드
	
	@ManyToOne
	private Member memberCode; //회원 코드
	
	@ManyToOne
	private Discount discountCode; //할인코드
	
}
