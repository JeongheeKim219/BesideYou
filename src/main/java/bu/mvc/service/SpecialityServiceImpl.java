package bu.mvc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bu.mvc.domain.Counselor;
import bu.mvc.domain.Speciality;
import bu.mvc.respsitory.SpecialityRepository;

@Service
@Transactional
public class SpecialityServiceImpl implements SpecialityService {
	
	@Autowired
	private SpecialityRepository specialityRap;
	
	@Override
	public List<Speciality> selectByCounselor(Long counselorCode) {

		return specialityRap.searchByCode(counselorCode);
	}

	/*@Override x
	public void update( Counselor counselor,Speciality speciality,String [] spcNames) {
		
		
		Counselor co = new Counselor(counselor.getCounselorCode());//상담사의 code
		
		specialityRap.deleteById(counselor.getCounselorCode());
		
		List<Speciality> spcList = new ArrayList<Speciality>();
		for(String spcName: spcNames) {
			Speciality spc = new Speciality(null, spcName, co);
			spcList.add(spc);
			
		}
		 specialityRap.saveAll(spcList);
	}*/

	

	/*
	 * @Override public List<Speciality> updateSpeciality(Long code, Speciality
	 * speciality) {
	 * 
	 * 
	 * //List<Speciality> sp = specialityRap.searchByCode(code);
	 * 
	 * //sp.setSpecialityName(speciality.getSpecialityName());
	 * 
	 * return specialityRap.searchByCode(code); }
	 */

}
