package bu.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import bu.mvc.domain.Ticket;
import bu.mvc.domain.TicketLines;

public interface TicketLinesService {

	/**
	 * 상담권 사용 내역 전체보기 : 관리자
	 * */
	Page<TicketLines> selectAll(Pageable pageable);
	
	/**
	 * 회원 id로 상담권 사용 내역 검색하기 : 로그인한 사용자
	 *  - 회원 id로 검색하여 사용자 마이페이지에서 출력
	 * */
	List<TicketLines> searchBy(String id, Pageable pageable);
	
	/**
	 * 상담사코드로 상담권 사용 내역 검색하기
	 *  - 각 상담사들의 실적 확인
	 * */
	List<TicketLines> searchBy(Long counselorCode, Pageable pageable);
	
	/**
	 * 상담권 사용 내역 삭제하기
	 * */
	void delete(Long ticketLinesCode);
}
