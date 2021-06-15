package bu.mvc.service;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bu.mvc.domain.Authority;
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
	private PasswordEncoder passwordEncoder;	

	@Override
	public int joinMember(Member member) {
		// 회원테이블에 등록(패스워드 평문을 암호화 - PasswordEncoder 필수!!!)
				// 평문으로 되어있는 비밀버호를 암호화 과정이 필요하다.
				String pass = passwordEncoder.encode(member.getPassword());
				member.setPassword(pass);
				
			   System.out.println("member.beforeDateOfBirth : "+member.getBeforeDateOfBirth());
				
			   LocalDate localDate =  LocalDate.parse(member.getBeforeDateOfBirth());
				member.setDateOfBirth(localDate);
				
				member = memberRep.save(member);
				
				if(member == null)throw new RuntimeException("회원가입에 실패했습니다.");
				
				
				// 기본 권한 등록
				
				Authority auth = 
						authorityRep.save(new Authority(null, member, RoleConstants.ROLE_MEMBER));
				
				if(auth == null)throw new RuntimeException("권한 설정의 오류로 가입에 실패했습니다.");
				 
				
				
				return 1;
			}

	@Override
	public String idcheck(String id) {
		Member member=memberRep.findById(id);
		return (member==null) ? "ok":"fail"; 	
	}
	}

