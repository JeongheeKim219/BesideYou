package bu.mvc.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bu.mvc.domain.Member;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	
	
	@Override
	public int joinMember(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

}
