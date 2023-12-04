package bu.mvc.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import bu.mvc.domain.Ticket;

public interface TicketService {

	/**
	 * 상담권 구매 목록 전체 보기
	 * */
	Page<Ticket> selectAll(Pageable pageable);

	/**
	 * 회원 id로 상담권 구매 목록 검색하기
	 *  - 회원 id로 검색하여 사용자 마이페이지에서 출력
	 * */
	Page<Ticket> searchById(String id, Pageable pageable);
	
	/**
	 * 상담권 코드로 상담권 검색하기
	 * */
	Ticket selectByCode(Long ticketCode);

	/**
	 * 상담권 구매하기
	 * */
	void insert(Ticket ticket);
	
	/**
	 * 상담권 사용하기
	 *  - 잔여량이 남아있을 때만 사용 가능.
	 *  - 사용할 때마다 잔여량 -1
	 * */
	void useTicket(Long ticketCode);
	
	/**
	 * 상담권 삭제하기
	 * */
	void delete(Long ticketCode);
	
}
