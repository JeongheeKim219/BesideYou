package bu.mvc.service;

import bu.mvc.domain.Counsel;
import bu.mvc.domain.Counselor;

public interface CounselService {
	
	/**
	 * 상담사 코드로 상담사 이름 가져오기
	 * */
	Counselor getCounselor(Long counselorCode);
	
	/**
	 * 상담사에 대한 잔여 상담권 수량 가져오기
	 * */
	int getRemainTicket(Long counselorCode, Long memberCode, int ticketField);
	
	/**
	 * 사용자의 상담 신청(타입 - 0,1,2)
	 * */
	int submit012(Counsel counsel);
	
	/**
	 * 사용자의 상담 신청(타입 - 3)
	 * */
	
	/**
	 * 상담사의 상담 승인 (타입 - 0,1,2)
	 * */
	
	/**
	 * 상담사의 상담 반려 (타입 - 0,1,2)
	 * */
	
	/**
	 * 상담사의 답변 등록 (타입 - 3) 
	 * */
	
	
	
}
