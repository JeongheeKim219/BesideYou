package bu.mvc.hs.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import bu.mvc.domain.Contact;

public interface ContactService {
	
	/**
	 * 전체 문의글 가져오기
	 * */
	Page<Contact> selectAll(Pageable pageable);
	
	/**
	 * 문의글 등록하기
	 * */
	void insert(Contact contact);

}