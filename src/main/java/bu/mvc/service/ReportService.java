package bu.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import bu.mvc.domain.Report;

public interface ReportService {
	/**
	 * 신고등록
	 * */
	void insert(Report report);

	/**
	 * 신고 출력
	 * */
	Page<Report> selectAll(Pageable pageable);
	
	/**
	 * 신고리뷰 찾기
	 * */
	List<Report> selectByReviewNo(Long reviewCode);

}
