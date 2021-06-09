package bu.mvc.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@NoArgsConstructor
@Getter
@Setter
@Entity
public class Member {
	
	@Id
	private String memberCode; 
	private String id; 
	private String password; 
	private String name; 
	private String alias; 
	private String addr; 
	private String phone; 
	private String email; 
	
	@Column(name = "date_of_birth")
	@Temporal(TemporalType.DATE)
	private Date dateOfBirth; 
	
	@Column(name = "date_of_reg")
	@Temporal(TemporalType.DATE)
	private Date dateOfReg = new Date();
	
	private int  state;
	private int  memberType;
	
	
	
	
	
	
}
