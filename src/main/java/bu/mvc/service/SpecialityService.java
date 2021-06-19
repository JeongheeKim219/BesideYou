package bu.mvc.service;

import bu.mvc.domain.Speciality;

public interface SpecialityService {
	
	
	/**
	 * 상담사 회원정보 보기
	 * */
	Speciality selectByCounselor(Long counselorCode);
}
