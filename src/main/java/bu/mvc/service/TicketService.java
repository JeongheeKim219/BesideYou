package bu.mvc.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import bu.mvc.domain.Ticket;

public interface TicketService {

	/**
	 * 상담권 구매 목록 전체 보기
	 * */
	List<Ticket> selectAll(Pageable pageable);

	/**
	 * id로 상담권 구매 목록 검색하기
	 *  - 회원 id로 검색하여 사용자 마이페이지에서 출력
	 * */
	List<Ticket> selectBy(Pageable pageable, String memberId);

	/**
	 * 상담권 상세보기
	 * */
	Ticket selectBy(Long ticketCode);

	/**
	 * 상담권 추가하기(구매)
	 * */
	void insert(Ticket ticket);
	
	/**
	 * 상담권 사용하기(잔여량 감소)
	 *  - 사용할 때마다 잔여량 -1 (잔여량이 남아있을 때만 : state true)
	 * */
	void update(Ticket ticket, boolean state);
	
	/**
	 * 상담권 환불하기
	 *  - 잔여량이 남아있을 때만 환불 가능.
	 *  - 잔여량이 남아있을 경우 잔여량을 0으로 만든다.
	 * */
	void update(Long tickKetCode, int ticketRemain, boolean state);
	
	/**
	 * 상담권 삭제하기
	 * */
	void delete(Long ticketCode);
	
}
