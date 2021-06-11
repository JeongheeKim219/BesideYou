package bu.mvc.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
public class Speciality {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "speciality_seq")
	@SequenceGenerator(sequenceName = "speciality_seq",allocationSize = 1,name = "speciality_seq")
	private Long specialityCode;
	private String specialityName;
	
	@ManyToOne
	@JoinColumn(name = "counselor_code")
	private Counselor counselorCode;
}
