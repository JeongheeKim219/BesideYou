package bu.mvc.domain;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Notice { //공지사항
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "notice_code_seq")
	@SequenceGenerator(sequenceName = "notice_code_seq", allocationSize = 1, name = "notice_code_seq")
	private Long noticeCode; //공지사항 번호
	private String noticeTitle; //공지사항 제목
	private String noticeContent; //공지사항 내용
	
	@CreationTimestamp
	private Date noticeDate; //공지사항 등록일
	private int noticeNum; //공지사항 조회수
	
	public Notice(Long noticeCode, String noticeTitle, String noticeContent, int noticeNum) {
		super();
		this.noticeCode = noticeCode;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeNum = noticeNum;
	}
	
	

}







