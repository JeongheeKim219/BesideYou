package bu.mvc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
	@Column(name = "price_code")
	private Long priceCode;
	@Column(name="counselor_field")
	private int counselorField;
	@Column(name = "counselor_price")
	private int counselorPrice;
	
	@OneToOne
	@JoinColumn(name = "counselor_code")
	private Counselor counselor;
}
