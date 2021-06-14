package bu.mvc.hs.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bu.mvc.domain.Notice;
import bu.mvc.respsitory.NoticeRepository;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeRepository noticeRepository;

	/**
	 * 공지사항 전체보기
	 * */
	@Override
	public List<Notice> selectAll() {
		return noticeRepository.findAll();
	}

	/**
	 * 공지사항 등록하기
	 * */
	@Override
	public void insert(Notice notice) {
		noticeRepository.save(notice);
	}

	/**
	 * 공지사항 상세보기
	 * */
	@Override
	public Notice selectById(Long noticeCode, boolean state) {
		if(state) noticeRepository.readnumUpdate(noticeCode);
		return noticeRepository.findById(noticeCode).orElse(null);
	}

	/**
	 * 공지사항 삭제하기
	 * */
	@Override
	public void delete(Long noticeCode) {
		noticeRepository.deleteById(noticeCode);
	}

	/**
	 * 공지사항 수정하기
	 * */
	@Override
	public Notice update(Notice notice) {
		Notice dbNotice = noticeRepository.findById(notice.getNoticeCode()).orElse(null);
		dbNotice.setNoticeTitle(notice.getNoticeTitle());
		dbNotice.setNoticeContent(notice.getNoticeContent());
		return dbNotice;
	}

}











