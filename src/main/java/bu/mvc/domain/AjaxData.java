package bu.mvc.domain;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class AjaxData {

	List<String> weekList;
	
	List<String> yearMonthList;
	
	List<Integer> counselCountList;
	 
	List<Integer> counselReqList;


}
