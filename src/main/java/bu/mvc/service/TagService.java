package bu.mvc.service;

import java.util.List;

import bu.mvc.domain.Tag;

public interface TagService {
	
	/**
	 * 태그 등록
	 * */
	//void tagInsert(Tag tag);
	
	/**
	 * 상담사 정보 보기 
	 * */
	List<Tag> selectByCounselor(Long counselorCode);
	
	
}
