package bu.mvc.service;

import bu.mvc.domain.Counsel;
import bu.mvc.domain.Counselor;
import bu.mvc.domain.RequestAns;
import bu.mvc.domain.Requests;

public interface RequestService {
	
	
	/**
	 * 상담에 대한 정보 가져오기
	 * */
	Counsel getCounsel(Long counselCode);
	
	/**
	 * 신청 상세보기
	 * */
	Requests read(Counsel counsel);
	
	/**
	 * 신청의 답변 확인하기
	 * */
	RequestAns getAnswer(Requests requests);
	
	/**
	 * request객체 코드로 가져오기
	 * */
	Requests getRequests(Long requestCode);
	
	/**
	 * 답글 넣기
	 * */
	void addAns(RequestAns requestAns);
	
}
