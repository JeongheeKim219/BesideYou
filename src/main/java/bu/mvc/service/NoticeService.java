package bu.mvc.service;

import java.util.List;

import bu.mvc.domain.Notice;

public interface NoticeService {
	
	/**
	 * 공지사항 전체보기
	 * */
	List<Notice> selectAll();
	
	/**
	 * 공지사항 등록하기
	 * */
	void insert(Notice notice);
	
	/**
	 * 공지사항 상세보기
	 * */
	Notice selectById(Long noticeCode, boolean state);
	
	/**
	 * 공지사항 삭제하기
	 * */
	void delete(Long noticeCode);
	
	/**
	 * 공지사항 수정하기
	 * */
	Notice update(Notice notice);

}














