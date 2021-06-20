package bu.mvc.domain;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
public class Report {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "report_seq")
	@SequenceGenerator(sequenceName = "report_seq", allocationSize = 1, name = "report_seq")
	private Long reportCode;
	
	@ManyToOne
	@JoinColumn(name = "member_code")
	private Member memberCode; // 회원코드
	
	
	@ManyToOne
	@JoinColumn(name = "REVIEW_CODE")
	private ReviewStar reviewCode; // 리뷰코드
	
	@CreationTimestamp
	private Date reportDate; // 리뷰작성날짜

	public Report(Long reportCode, Member memberCode, ReviewStar reviewACode) {
		super();
		this.reportCode = reportCode;
		this.memberCode = memberCode;
		this.reviewCode = reviewACode;
	}
	
	
	

}
