package bu.mvc.domain;

import javax.persistence.Entity;
import javax.persistence.Id;




import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Authority {
	
	
	@Id
	private Long AuthorityCode;
	
	private int memberCode;
	private String role;
}
