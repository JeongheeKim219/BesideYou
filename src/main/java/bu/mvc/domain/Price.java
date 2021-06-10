package bu.mvc.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Price {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "price_seq")
	@SequenceGenerator(sequenceName = "price_seq",allocationSize = 1,name = "price_seq")
	private Long priceCode;
	private int counselorField;
	private int counselorPrice;
	
	@OneToOne
	private Counselor counselorCode;
}
