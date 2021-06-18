package bu.mvc.service;

import bu.mvc.domain.Counselor;

public interface CounselorService {
	
	
	/**
	 * 상담사 신청
	 * */
	void joinCounselor(Counselor counselor , String [] tagNams, int [] prices);
}
