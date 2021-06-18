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
import lombok.ToString;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Report {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "report_seq")
	@SequenceGenerator(sequenceName = "report_seq", allocationSize = 1, name = "report_seq")
	
	private Long reportCode;
	
	
	@ManyToOne
	@JoinColumn(name = "member_code")
	private Member member; // 회원코드
	
	
	@ManyToOne
	@JoinColumn(name = "REVIEW_CODE")
	private ReviewStar reviewStar; // 리뷰코드
	
	@CreationTimestamp
	private Date reportDate; // 신고날자
	
	private String reportOption; // 신고 사유

	

	public Report(Long reportCode) {
		
		this.reportCode = reportCode;
	}


	public Report(Long reportCode, Member member, ReviewStar reviewStar, String reportOption) {
		super();
		this.reportCode = reportCode;
		this.member = member;
		this.reviewStar = reviewStar;
		this.reportOption = reportOption;
	}





	
	

	
	
	
	

}
