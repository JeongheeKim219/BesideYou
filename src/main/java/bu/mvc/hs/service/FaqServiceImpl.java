package bu.mvc.hs.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import bu.mvc.domain.Faq;
import bu.mvc.respsitory.FaqRepository;

@Service
@Transactional
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private FaqRepository faqRepository;

	/**
	 * FAQ전체보기
	 * */
	@Override
	public List<Faq> selectAll() {
		return faqRepository.findAll(Sort.by(Sort.Direction.ASC, "faqCode"));
	}

	/**
	 * 주문,결제 FAQ 보기
	 * */
	@Override
	public List<Faq> selectOne() {
		return faqRepository.selectOne();
	}

	/**
	 * 상담기록 FAQ 보기
	 * */
	@Override
	public List<Faq> selectTwo() {
		return faqRepository.selectTwo();
	}

	/**
	 * 상담사문의 FAQ 보기
	 * */
	@Override
	public List<Faq> selectThree() {
		return faqRepository.selectThree();
	}

	/**
	 * 로그인 FAQ 보기
	 * */
	@Override
	public List<Faq> selectFour() {
		return faqRepository.selectFour();
	}

	/**
	 * 서비스문의 FAQ 보기
	 * */
	@Override
	public List<Faq> selectFive() {
		return faqRepository.selectFive();
	}

	/**
	 * 기타 FAQ 보기
	 * */
	@Override
	public List<Faq> selectSix() {
		return faqRepository.selectSix();
	}

	/**
	 * FAQ 등록하기
	 * */
	@Override
	public void insert(Faq faq) {
		faqRepository.save(faq);
	}

	/**
	 * FAQ 상세보기
	 * */
	@Override
	public Faq selectById(Long faqCode) {
		return faqRepository.findById(faqCode).orElse(null);
	}

	/**
	 * FAQ 삭제하기
	 * */
	@Override
	public void delete(Long faqCode) {
		faqRepository.deleteById(faqCode);
	}

	/**
	 * FAQ 수정하기
	 * */
	@Override
	public Faq update(Faq faq) {
		Faq dbFaq = faqRepository.findById(faq.getFaqCode()).orElse(null);
		dbFaq.setFaqCategory(faq.getFaqCategory());
		dbFaq.setFaqTitle(faq.getFaqTitle());
		dbFaq.setFaqContent(faq.getFaqContent());
		return dbFaq;
	}

}


















