package bu.mvc.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
public class RequestAns {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "request_ans_seq")
	@SequenceGenerator(sequenceName = "request_ans_seq",allocationSize = 1, name = "request_ans_seq")	
	private Long ansCode;
	
	@OneToOne
	@JoinColumn(name = "request_code")
	private Requests requests;
	
	@ManyToOne
	@JoinColumn(name = "COUNSELOR_CODE")
	private Counselor counselor;
	
	private String ansContent;
	
	@CreationTimestamp
	private Date ansDate;

	public RequestAns(Long ansCode, Requests requests, Counselor counselor, String ansContent) {
		this.ansCode = ansCode;
		this.requests = requests;
		this.counselor = counselor;
		this.ansContent = ansContent;
	}
	
}
