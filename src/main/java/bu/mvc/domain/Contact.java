package bu.mvc.domain;

import java.sql.Date;
import java.util.List;

import javax.persistence.CascadeType;
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
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Contact { //1:1문의
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "contact_code_seq")
	@SequenceGenerator(sequenceName = "contact_code_seq", allocationSize = 1, name = "contact_code_seq")
	private Long contactCode; //문의글 번호
	private int contactCategory; //문의글 유형
	private String contactTitle; //문의글 제목
	private String contactContent; //문의글 내용
	private int contactState; // 문의글 처리상태 0미처리 1처리
	
	@CreationTimestamp
	private Date contactDate; //문의글 작성일
	
	@ManyToOne
	@JoinColumn(name = "member_code")
	private Member member; //회원 코드를 가져와야	한다.
	
	@OneToOne(mappedBy = "contact", cascade = CascadeType.ALL)
	@JoinColumn(name = "contact_reply")
	private ContactReply contactReply;
	

	
	public Contact(Long contactCode, int contactCategory, String contactTitle, String contactContent, int contactState,
			Member member) {
		super();
		this.contactCode = contactCode;
		this.contactCategory = contactCategory;
		this.contactTitle = contactTitle;
		this.contactContent = contactContent;
		this.contactState = contactState;
		this.member = member;
	}


	public Contact(Long contactCode) {
		super();
		this.contactCode = contactCode;
	}
	

}





