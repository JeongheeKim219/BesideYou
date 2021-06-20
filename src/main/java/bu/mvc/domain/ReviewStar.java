package bu.mvc.domain;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;

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
	private Member member; // 회원코드
	
	@ManyToOne
	@JoinColumn(name = "COUNSELOR_CODE")
	private Counselor counselor; // 상담사 코드
	
	@ManyToOne
	@JoinColumn(name = "COUNSEL_CODE")
	private Counsel counsel; // 상담코드
	
	//@CreationTimestamp
	private LocalDateTime reviewDate; // 리뷰작성날짜
	
	private double star; // 별점
	private String reviewContent; // 리뷰 내용
	
	

	public ReviewStar(Long reviewCode, Member member, Counselor counselorCode, Counsel counselCode, double star,
			String reviewContent) {
		super();
		this.reviewCode = reviewCode;
		this.member = member;
		this.counselor = counselorCode;
		this.counsel = counselCode;
		this.star = star;
		this.reviewContent = reviewContent;
	}



	public ReviewStar(Long reviewCode) {

		this.reviewCode = reviewCode;
	}
	
	
	
	
	
	
	
}
