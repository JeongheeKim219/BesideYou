package bu.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bu.mvc.domain.Member;
import bu.mvc.respsitory.AuthorityRepository;
import bu.mvc.respsitory.MemberRepository;


@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberRepository memberRep;
	
	@Autowired
	private AuthorityRepository authorityRep;
	
	@Autowired
	private PasswordEncoder passwordEncoder;	// root-context에 BCryptPasswordEncoder 생성

	@Override
	public int joinMember(Member member) {
		// 회원테이블에 등록(패스워드 평문을 암호화 - PasswordEncoder 필수!!!)
		// 평문으로 되어있는 비밀버호를 암호화 과정이 필요하다.
		String pass = passwordEncoder.encode(member.getPassword());
		member.setPassword(pass);
		
		
		return 0;
	}
}
