package bu.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import bu.mvc.domain.Refund;

public interface RefundService {

	/**
	 * 환불 신청 목록 전체 보기
	 * */
	Page<Refund> selectAll(Pageable pageable);
	
	/**
	 * 회원 id로 환불 신청 내역 검색하기
	 *  - 회원 id로 검색하여 사용자 마이페이지에서 출력
	 * */
	List<Refund> searchBy(String id, Pageable pageable);
	
	/**
	 * 환불 신청 내역 상세보기
	 * */
	Refund selectByCode(Long refundCode);
	
	/**
	 * 상담권 코드로 환불 진행 상태 검색하기
	 * */
	int selectByTicketCode(Long ticketCode);
	
	/**
	 * 환불 신청하기
	 * */
	void insert(Refund refund);
	
	/**
	 * 환불 처리하기
	 *  1. 상담권 잔여량이 남아있을 때만 환불 가능.
	 *  2. 상담권 잔여량이 남아있을 경우 잔여량을 0으로 만든다.
	 *  3. 환불 불가 결정 or 환불 완료시 신청 내역의 진행 상태를 변경한다.
	 * */
	void refundTicket(Refund refund);
	
	/**
	 * 환불 신청 내역 삭제하기
	 * */
	void delete(Long refundCode);
	
}
