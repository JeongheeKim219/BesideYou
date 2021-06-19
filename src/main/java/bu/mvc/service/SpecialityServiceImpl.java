package bu.mvc.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bu.mvc.domain.Speciality;
import bu.mvc.respsitory.SpecialityRepository;

@Service
@Transactional
public class SpecialityServiceImpl implements SpecialityService {
	
	@Autowired
	private SpecialityRepository specialityRap;
	
	@Override
	public Speciality selectByCounselor(Long counselorCode) {
		
		return specialityRap.searchByCode(counselorCode);
	}

}
