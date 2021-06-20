package bu.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import bu.mvc.domain.Counselor;
import bu.mvc.domain.Speciality;

public interface CounselorService {
	
	
	/**
	 * 상담사 신청
	 * */
	void joinCounselor(Counselor counselor , String [] tagNams, int [] prices, String [] spcNames);

	/**
	 * 상담사 회원정보 보기
	 * */
	Counselor selectByCounselor(Long memberCode);

	/**
	 * 상담사 수정하기
	 * */
	void updateCounselor( Long code, Counselor counselor, Speciality speciality,String [] spcNames, String [] tagNames,int [] prices);
	
	/**
	 * 전체 검색
	 * */
	List<Counselor> selectAll();
	
	/**
	 * 전체검색 - Page처리
	 * */
	Page<Counselor> selectAll(Pageable pageable);

}
