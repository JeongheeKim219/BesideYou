package bu.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
public class Refund {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "refund_code_seq")
	@SequenceGenerator(sequenceName = "refund_code_seq", allocationSize = 1, name = "refund_code_seq")
	private Long refundCode; //환불 요청 코드
	private String refundReason; //환불 요청 사유
	private int refundState; //환불 진행 상태 (0:처리중 / 1:환불불가 / 2:환불완료)

	@CreationTimestamp
	private LocalDateTime refundDate; //환불 요청일
	
	@OneToOne
	@JoinColumn(name = "ticket_code") //상담권 코드
	private Ticket ticket;
}
