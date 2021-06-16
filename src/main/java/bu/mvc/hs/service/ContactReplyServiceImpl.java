package bu.mvc.hs.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bu.mvc.domain.ContactReply;
import bu.mvc.respsitory.ContactReplyRepository;
import bu.mvc.respsitory.ContactRepository;

@Service
@Transactional
public class ContactReplyServiceImpl implements ContactReplyService {
	
	@Autowired
	private ContactReplyRepository contactReplyRepository;
	
	@Autowired
	private ContactRepository contactRepository;

	/**
	 * 답변 등록 하기
	 * */
	@Override
	public void insert(ContactReply contactReply) {
		contactReplyRepository.save(contactReply);
		contactRepository.stateUpdate();
	}

	/**
	 * 답변 삭제하기
	 * */
	@Override
	public void delete(Long contactReplyCode) {
		contactReplyRepository.deleteById(contactReplyCode);
	}

}





















