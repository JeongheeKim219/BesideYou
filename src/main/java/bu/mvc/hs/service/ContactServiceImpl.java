package bu.mvc.hs.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import bu.mvc.domain.Contact;
import bu.mvc.respsitory.ContactRepository;

@Service
@Transactional
public class ContactServiceImpl implements ContactService {
	
	@Autowired
	private ContactRepository contactRepository;

	/**
	 * 전체 문의글 가져오기
	 * */
	@Override
	public Page<Contact> selectAll(Pageable pageable) {
		return contactRepository.findAll(pageable);
	}

	/**
	 * 문의글 등록하기
	 * */
	@Override
	public void insert(Contact contact) {
		contactRepository.save(contact);
	}

	/**
	 * 상세보기
	 * */
	@Override
	public Contact selectById(Long contactCode) {
		return contactRepository.findById(contactCode).orElse(null);
	}

	/**
	 * 삭제하기
	 * */
	@Override
	public void delete(Long contactCode) {
		contactRepository.deleteById(contactCode);
	}

}


















