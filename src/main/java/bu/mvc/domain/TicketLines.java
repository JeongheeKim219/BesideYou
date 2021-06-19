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
public class TicketLines {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ticket_lines_seq")
	@SequenceGenerator(sequenceName = "ticket_lines_seq", allocationSize = 1, name = "ticket_lines_seq")
	private Long ticketLinesCode; //상담권 사용 내역 코드
	
	@CreationTimestamp
	private LocalDateTime ticketLinesDate; //상담권 사용 일자
	
	@OneToOne
	@JoinColumn(name="ticket_code") //상담권 코드
	private Ticket ticket;

	public TicketLines(Ticket ticket) {
		this.ticket = ticket;
	}

}
