package bu.mvc.domain;

import java.time.LocalDateTime;

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
public class Counsel {
	
	@Id
	private Long counselCode;
	private Long memberCode;
	private Long counselorCode;
	private int counselCategory;
	private int counselState;
	private LocalDateTime counselReqDate;
	private LocalDateTime counselDate;
	
}
