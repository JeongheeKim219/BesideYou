package bu.mvc.service;

import java.util.List;

import bu.mvc.domain.Counselor;
import bu.mvc.domain.Speciality;

public interface SpecialityService {
	
	
	/**
	 * 상담사 회원정보 보기
	 * */
	List<Speciality> selectByCounselor(Long counselorCode);
	
	/**
	 * 상담사 수정하기 xx
	 * */
	//void update( Counselor counselor,Speciality speciality,String [] spcNames);
	
	
}
