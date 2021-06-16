package bu.mvc.service;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
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
	/**
	 * 중복체크
	 * */
	@Override
	public String idcheck(String id) {
		Member member=memberRep.findById(id);
		return (member==null) ? "ok":"fail"; 	
	}
	/**
	 * 
	 * 아이디찾기
		*/
	@Override
	public String idFind(Member member) {
		//String id = member.getId();
		
		 //System.out.println("member.beforeDateOfBirth : "+member.getBeforeDateOfBirth());
		 
		LocalDate localDate =  LocalDate.parse(member.getBeforeDateOfBirth());		
		//member.setDateOfBirth(localDate);
		
		//System.out.println("member.getName() : " + member.getName());
		
		String searchId = memberRep.searchId(member.getName(), localDate);
		if(searchId==null) {
			throw new RuntimeException("가입된 정보가 없습니다.");
			
		}
		return searchId;
	}
	
	/**
	 * 비밀번호 찾기
	 * */
	@Override
	public String passFind(Member member) {
		
		LocalDate localDate = LocalDate.parse(member.getBeforeDateOfBirth());
		
		//String 
		String pass=memberRep.searchPass(member.getId(), member.getName(), localDate);
				
		if(pass!=null) {//모두 일치했다.
			 //임시 비번을 생성(id+1234)
			String encodePass = passwordEncoder.encode(member.getId()+"1234");
			
			memberRep.update(encodePass, member.getId());
			 
		}else {
			throw new RuntimeException("가입된 정보가 없습니다.");
		}
		return member.getId()+"1234";//임시비번 리턴
	}
	
	/**
	 * 회원 정보 보기
	 * */
	@Override
	public Member selectByMember(Long memberCode) {
		
		return memberRep.findById(memberCode).orElse(null);
	}
	/**
	 * 회원정보 수정하기 (회원)
	 * */
	@Override
	public void updateMember(Member member) {
		memberRep.updateMember(member.getPassword(),member.getAlias(),member.getEmail(),member.getPhone(),member.getMemberCode());
		
	}
	/**
	 * 회원탈퇴
	 * */
	@Override
	public void delete(Long memberCode, String password) {
		Member member=memberRep.findById(memberCode).orElse(null);
		
		
		memberRep.deleteById(memberCode);
	}
	
	
	}

