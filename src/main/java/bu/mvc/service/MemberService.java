package bu.mvc.service;

import bu.mvc.domain.Member;

public interface MemberService {
	
	
	/**
	 * 회원가입
	 * */
	int joinMember(Member member);
	
	/**
	 * 아이디 중복체크
	 * */
	String idcheck(String id);
	/**
	 * 아이디 찾기
	 * */
	String idFind(Member member);
	
	/**
	 * 비밀번호 찿기
	 * */
	String passFind(Member member);
	/**
	 * 회원정보 보기
	 * */
	Member selectByMember(Long memberCode);
	/**
	 * 회원정보 수정(회원)
	 * */
	void updateMember(Member member);
	/**
	 * 회원탈퇴
	 * */
	void delete(Long memberCode,String password);
}
