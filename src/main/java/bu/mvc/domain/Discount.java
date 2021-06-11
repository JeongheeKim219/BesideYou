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

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Discount {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "discount_code_seq")
	@SequenceGenerator(sequenceName = "discount_code_seq", allocationSize = 1, name = "discount_code_seq")
	private Long discountCode; //할인 코드
	private int discountRate; //할인율
	
	//할인 코드만 인수로 받는 생성자
	public Discount(Long discountCode) {
		this.discountCode = discountCode;
	}
}
