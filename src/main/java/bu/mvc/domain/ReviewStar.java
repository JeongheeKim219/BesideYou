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
public class ReviewStar {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "review_seq")
	@SequenceGenerator(sequenceName = "review_seq", allocationSize = 1, name = "review_seq")
	private Long reviewCode; //리뷰번호
	@ManyToOne
	@JoinColumn(name = "member_code")
	private Member memberCode; // 회원코드
	@ManyToOne
	@JoinColumn(name = "COUNSELOR_CODE")
	private Counselor counselorCode; // 상담사 코드
	@ManyToOne
	@JoinColumn(name = "COUNSEL_CODE")
	private Counsel counselCode; // 상담코드
	@CreationTimestamp
	private Date reviewDate; // 리뷰작성날짜
	
	private double star; // 별점
	private String reviewContent; // 리뷰 내용
	
	

	public ReviewStar(Long reviewCode, Member memberCode, Counselor counselorCode, Counsel counselCode, double star,
			String reviewContent) {
		super();
		this.reviewCode = reviewCode;
		this.memberCode = memberCode;
		this.counselorCode = counselorCode;
		this.counselCode = counselCode;
		this.star = star;
		this.reviewContent = reviewContent;
	}



	public ReviewStar(Long reviewCode) {

		this.reviewCode = reviewCode;
	}
	
	
	
	
	
	
	
}
