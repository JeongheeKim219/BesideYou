package bu.mvc.service;

import bu.mvc.domain.Contact;
import bu.mvc.domain.ContactReply;

public interface ContactReplyService {
	
	/**
	 * 답변 상세 조회
	 * */
	Contact selectById(Long contactCode);
	
	/**
	 * 답변 등록
	 * */
	void insert(ContactReply contactReply);
	
	/**
	 * 답변 삭제하기
	 * */
	void delete(Long contactReplyCode);

}
