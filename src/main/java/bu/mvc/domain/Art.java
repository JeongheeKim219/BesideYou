package bu.mvc.domain;

import java.time.LocalDateTime;

public class Art {

	private Long artCode;
	
	private LocalDateTime uploadDate;
	private String fileName;
	private int state;
	
	//private Long memberCode;
	//private Long artCounselorCode;
	private ArtCounselor artCounselor;


}
