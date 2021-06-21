package bu.mvc.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import bu.mvc.domain.Contact;

public interface ContactService {
	
	/**
	 * 관리자가 전체 문의글 가져오기
	 * */
	Page<Contact> selectAll(Pageable pageable);
	
	/**
	 * 회원이 전체 문의글 가져오기
	 * */
	Page<Contact> findByMemberMemberCode(Pageable pageable, Long memberCode);
	
	/**
	 * 문의글 등록하기
	 * */
	void insert(Contact contact);
	
	/**
	 * 상세보기
	 * */
	Contact selectById(Long contactCode);
	
	/**
	 * 삭제하기
	 * */
	void delete(Long contactCode);
	
	/**
	 * 수정하기
	 * */
	Contact update(Contact contact);

}
