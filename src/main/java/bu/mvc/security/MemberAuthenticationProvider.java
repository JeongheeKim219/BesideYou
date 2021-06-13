package bu.mvc.security;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import bu.mvc.domain.Authority;
import bu.mvc.domain.Member;
import bu.mvc.respsitory.AuthorityRepository;
import bu.mvc.respsitory.MemberRepository;
import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

import lombok.RequiredArgsConstructor;

@Service	// id = "memberAuthenticationProvider"
//@RequiredArgsConstructor
public class MemberAuthenticationProvider implements AuthenticationProvider {
	
	@Autowired
	private MemberRepository memberRep;
	
	@Autowired
	private AuthorityRepository authorityRep;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Bean	
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {	// �μ��� ���޵Ȱ��� ����ڰ� �Է��� id�� �н����� ������ �������ִ� Authentication
		
		
		String userId = authentication.getName();
		System.out.println(userId);
		Member member =memberRep.findById(userId);
		
		if(member == null) throw new UsernameNotFoundException(userId + "는 존재하지 않아 인증에 실패했습니다");
		
	
		String pass = (String)authentication.getCredentials();	
		
		if(!passwordEncoder.matches(pass, member.getPassword())) {	
			throw new UsernameNotFoundException("비밀번호 오류 입니다..");
		}
		//List<Authority> authList = authorityRep.selectAuthorityByUserName(0);
		
		List<SimpleGrantedAuthority> simpleAuthList = new ArrayList<SimpleGrantedAuthority>();
		//for(Authority au : authList) {
		//	simpleAuthList.add(new SimpleGrantedAuthority(au.getRole()));	// DB의 권한을 Security의 권한타입에 맞게 변환하는 과정
		//}
		
		simpleAuthList.add(new SimpleGrantedAuthority("ROLE_USER"));
		
		return new UsernamePasswordAuthenticationToken(member, null, simpleAuthList);
	}

	
	@Override
	public boolean supports(Class<?> authentication) {
		
		
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}














