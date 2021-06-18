package bu.mvc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bu.mvc.domain.Counselor;
import bu.mvc.domain.Tag;
import bu.mvc.respsitory.CounselorRepository;
import bu.mvc.respsitory.TagRepository;

@Service
@Transactional
public class CounselorServiceImpl implements CounselorService {

	@Autowired
	private CounselorRepository counselorRep;
	
	@Autowired
	private TagRepository tagRepository;
	
	@Override
	public void joinCounselor(Counselor counselor , String [] tagNams) {
		counselorRep.save(counselor);

		//TAG를 등록하기 위해서 상담의 코드를 가져오고 전달된 tagName만큼 Tag객체를 생성해서 한번에 insert한다.
		Counselor co = new Counselor(counselor.getCounselorCode());//상담사의 code
		
		List<Tag> tagList = new ArrayList<Tag>();
		for(String tagName: tagNams) {
			Tag tag = new Tag(null, tagName, co);
			tagList.add(tag);
			
		}
		
		
		tagRepository.saveAll(tagList);
		
	}

}
