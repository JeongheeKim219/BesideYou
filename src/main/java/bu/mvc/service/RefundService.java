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
	Refund selectBy(Long refundCode);
	
	/**
	 * 환불 신청 내역 수정하기
	 *  - 환불 완료 후 상태 변경 등
	 * */
	
	
	/**
	 * 환불 신청 내역 삭제하기
	 * */
	
	
}
