package bu.mvc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bu.mvc.domain.Counselor;
import bu.mvc.domain.Price;
import bu.mvc.domain.Speciality;
import bu.mvc.domain.Tag;
import bu.mvc.respsitory.CounselorRepository;
import bu.mvc.respsitory.PriceRepository;
import bu.mvc.respsitory.SpecialityRepository;
import bu.mvc.respsitory.TagRepository;

@Service
@Transactional
public class CounselorServiceImpl implements CounselorService {

	@Autowired
	private CounselorRepository counselorRep;
	
	@Autowired
	private TagRepository tagRepository;
	
	@Autowired
	private PriceRepository priceRap;
	
	@Autowired
	private SpecialityRepository specialityRap;
	
	/**
	 * 상담사 신청
	 * */
	@Override
	public void joinCounselor(Counselor counselor , String [] tagNams, int [] prices,String [] spcNames) {
		counselorRep.save(counselor);

		//TAG를 등록하기 위해서 상담의 코드를 가져오고 전달된 tagName만큼 Tag객체를 생성해서 한번에 insert한다.
		Counselor co = new Counselor(counselor.getCounselorCode());//상담사의 code
		
		List<Speciality> spcList = new ArrayList<Speciality>();
		for(String spcName: spcNames) {
			Speciality spc = new Speciality(null, spcName, co);
			spcList.add(spc);
			
		}
		specialityRap.saveAll(spcList);
		
		
		List<Tag> tagList = new ArrayList<Tag>();
		for(String tagName: tagNams) {
			Tag tag = new Tag(null, tagName, co);
			tagList.add(tag);
			
		}
		tagRepository.saveAll(tagList);
		
		
		
		priceRap.save(new Price(null, 0, prices[0], co));
		priceRap.save(new Price(null, 1, prices[1], co));
		priceRap.save(new Price(null, 2, prices[2], co));
		priceRap.save(new Price(null, 3, prices[3], co));
		
		
		
		
	}
	
	/**
	 * 상담사 정보보기
	 * */
	@Override
	public Counselor selectByCounselor(Long memberCode) {
		
		return counselorRep.searchBymembercode(memberCode);
	}

	
	
	/**
	 * 상담사 수정
	 * */
	@Override
	public void updateCounselor(Long code, Counselor counselor, Speciality speciality,String [] spcNames,String [] tagNames, int [] prices) {
		//Counselor counselorCo = new Counselor(counselor.getCounselorCode());//상담사의 code
		
		Counselor co = counselorRep.searchBymembercode(code);
		System.out.println(co.getCounselorCode());
		co.setCareer(counselor.getCareer());
		
		
		
		specialityRap.deleteByCounselorCode(co.getCounselorCode());
		
		List<Speciality> spcList = new ArrayList<Speciality>();
		for(String spcName: spcNames) {
			Speciality spc = new Speciality(null, spcName, co);
			spcList.add(spc);
			
		}
		
		 specialityRap.saveAll(spcList);
		 
		 tagRepository.deleteByCounselorCode(co.getCounselorCode());
		 
		 List<Tag> tagList = new ArrayList<Tag>();
			for(String tagName: tagNames) {
				Tag tag = new Tag(null, tagName, co);
				tagList.add(tag);
				
			}
			
			tagRepository.saveAll(tagList);
			
			priceRap.deleteByCounselorCode(co.getCounselorCode());
			priceRap.save(new Price(null, 0, prices[0], co));
			priceRap.save(new Price(null, 1, prices[1], co));
			priceRap.save(new Price(null, 2, prices[2], co));
			priceRap.save(new Price(null, 3, prices[3], co));
		
		//counselorRep.updateCounselor(counselor.getCareer(),counselor.getCounselorCode());
		
	}

	@Override
	public List<Counselor> selectAll() {
		
		return counselorRep.selectAll();
	}

	@Override
	public Page<Counselor> selectAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return counselorRep.findAll(pageable);
	}

}
