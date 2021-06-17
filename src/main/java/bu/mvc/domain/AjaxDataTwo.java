package bu.mvc.domain;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class AjaxDataTwo {

	List<Counselor> counselorList;
	
	List<Integer> counselSessions; 
	
	List<Integer> gapList;

}
