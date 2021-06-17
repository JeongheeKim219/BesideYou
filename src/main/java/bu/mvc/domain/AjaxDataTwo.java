package bu.mvc.domain;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class AjaxDataTwo {

	List<String> counselorNameList;

	List<Integer> sessionList; 

	List<Integer> gapList;
	
	List<Double> starList;

}
