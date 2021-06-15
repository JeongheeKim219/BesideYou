package bu.mvc.service;

import bu.mvc.domain.Member;

public interface MemberService {
	
	
	/**
	 * 회원가입
	 * */
	int joinMember(Member member);
	
	/**
	 * 아이디 체크
	 * */
	String idcheck(String id);
}
