package bu.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bu.mvc.domain.Member;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public int joinMember(Member member) {
		String pass = passwordEncoder.encode(member.getPassword());
		member.setPassword(pass);
		return 0;
	}

}
