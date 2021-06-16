package bu.mvc.hs.service;

import bu.mvc.domain.ContactReply;

public interface ContactReplyService {
	
	/**
	 * 답변 등록
	 * */
	void insert(ContactReply contactReply);
	
	/**
	 * 답변 삭제하기
	 * */
	void delete(Long contactReplyCode);

}
