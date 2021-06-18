package bu.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bu.mvc.domain.Tag;
import bu.mvc.respsitory.TagRepository;

@Service
@Transactional
public class TagServiceImpl implements TagService {
	
	@Autowired
	private TagRepository tagRap;
	
	@Override
	public void tagInsert(Tag tag) {
		tagRap.save(tag);
	}

}
