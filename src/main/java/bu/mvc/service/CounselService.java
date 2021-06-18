package bu.mvc.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import bu.mvc.domain.Counsel;
import bu.mvc.domain.Counselor;
import bu.mvc.domain.Member;
import bu.mvc.domain.Requests;

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
	void submit012(Counsel counsel);
	
	/**
	 * 사용자의 상담 신청(타입 - 3)
	 * */
	void submit3(Counsel counsel, Requests requests);
	
	/**
	 * 사용자의 상담 신청 리스트 (타입 - -1,0,1,2)
	 * */
	Page<Counsel> myList012(Pageable pageable, int field, Member member);
	
	
	
	
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
