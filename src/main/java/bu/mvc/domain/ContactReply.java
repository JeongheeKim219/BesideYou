package bu.mvc.domain;

import java.sql.Date;

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

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class ContactReply { //1:1문의 답변
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "contact_reply_code_seq")
	@SequenceGenerator(sequenceName = "contact_reply_code_seq", allocationSize = 1, name = "contact_reply_code_seq")
	private Long contactReplyCode; //문의글 답변 번호
	private String contactReplyContent; //문의글 답변 내용
	
	@CreationTimestamp
	private Date contactReplyDate; //문의글 답변 작성일
	
	@ManyToOne
	@JoinColumn(name = "contact_code")
	private Contact contact;

	public ContactReply(Long contactReplyCode, String contactReplyContent, Contact contact) {
		super();
		this.contactReplyCode = contactReplyCode;
		this.contactReplyContent = contactReplyContent;
		this.contact = contact;
	}
	

}
