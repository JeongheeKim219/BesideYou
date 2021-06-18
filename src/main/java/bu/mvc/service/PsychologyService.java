package bu.mvc.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import bu.mvc.domain.Art;
import bu.mvc.domain.ArtAnswer;
import bu.mvc.domain.ArtCounselor;
import bu.mvc.domain.Counselor;
import bu.mvc.domain.Member;
import bu.mvc.domain.Psychology;

public interface PsychologyService {

	/**
	 * 테스트 등록
	 * */
	void testInsert(Psychology psychology);
	
	/**
	 * 그림상담사 조회
	 * */
	Page<ArtCounselor> selectArtCounselor(Pageable pageable);
	
	/**
	 * 그림상담사 pk로 조회
	 * */
	ArtCounselor selectById(Long id);
	
	/**
	 * 그림테스트 등록
	 * */
	void artInsert(Art art);
	
	/**
	 * 그림상담사 등록
	 * */
	void signup(ArtCounselor artCounselor);
	
	/**
	 * 멤버코드에 해당하는 카운슬러 검색
	 * */
	Counselor selectByMem(Long id);
	
	/**
	 * 테스트결과조회
	 * */
	Psychology selectByCode(Long testCode);
	
	/**
	 * 그림상담사에 해당하는 ART 조회
	 * */
	//List<Art> selectByCounselor(ArtCounselor artCounselor);
	
	/////////////////////////////////////
	/**
	 * 그림상담사에 해당하는 ART 조회
	 * */
	List<Art> selectByCounselor(Counselor co);
	
	/**
	 * 카운슬러코드에 해당하는 아트카운슬러 조회
	 * */
	ArtCounselor selectByCounselorCode(Counselor co);
	
	/**
	 * artCode에 해당하는 art 조회...
	 * */
	Art selectByArtCode(Long artCode);
	
	/**
	 * 그림상담 답변등록
	 * */
	void insertAnswer(Long artCode, String artAnsContent);
	
	/**
	 * 멤버코드에 해당하는 그림상담 답변조회
	 * */
	List<ArtAnswer> selectAnswer(Long member);
	
	/**
	 * 멤버코드에 해당하는 그림상담 요청조회
	 * */
	List<Art> selectArt(Long member);
	
	/**
	 * 심리테스트 결과 조회
	 * */
	Page<Psychology> selectResult(Member member, Pageable pageable);
	
	/**
	 * 그림상담사 지시사항, 검사항목 수정
	 * */
	void updateQD(Long code, ArtCounselor artCounselor);
	
	/**
	 * 그림상담사 해지 -> artcounselor에서 state update
	 * */
	void updateState(Long code);

}
