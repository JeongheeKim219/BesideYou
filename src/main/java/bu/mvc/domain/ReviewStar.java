package bu.mvc.domain;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

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
	private int reviewCode; //리뷰번호
	private long memberCode; // 회원코드
	private int counselorCode; // 상담사 코드
	private int counselCode; // 상담코드
	private Date reviewDate; // 리뷰작성날짜
	private double star; // 별점
	private String reviewContent; // 리뷰 내용
}
