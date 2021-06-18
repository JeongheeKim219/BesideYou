package bu.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import bu.mvc.domain.Report;
import bu.mvc.respsitory.ReportRepository;

@Service
@Transactional
public class ReportServiceImpl implements ReportService {
	@Autowired
	private ReportRepository reportRepository;

	@Override
	public void insert(Report report) {
		reportRepository.save(report);
	}

	@Override
	public Page<Report> selectAll(Pageable pageable) {
		
		return reportRepository.findAll(pageable);
	}

	@Override
	public List<Report> selectByReviewNo(Long reviewCode) {
		// TODO Auto-generated method stub
		return null;
	}

}
