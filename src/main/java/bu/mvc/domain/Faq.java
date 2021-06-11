package bu.mvc.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Faq { //자주묻는질문
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "faq_code_seq")
	@SequenceGenerator(sequenceName = "faq_code_seq", allocationSize = 1, name = "faq_code_seq")
	private Long faqCode; //FAQ번호
	private int faqCategory; //FAQ카테고리
	private String faqTitle; //FAQ제목
	private String faqContent; //FAQ내용

}
