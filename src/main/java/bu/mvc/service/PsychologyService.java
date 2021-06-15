package bu.mvc.service;

import java.util.Date;
import java.util.List;

import bu.mvc.domain.Art;
import bu.mvc.domain.ArtCounselor;
import bu.mvc.domain.Psychology;

public interface PsychologyService {

	/**
	 * 테스트 등록
	 * */
	void testInsert(Psychology psychology);
	
	/**
	 * 그림상담사 조회
	 * */
	List<ArtCounselor> selectArtCounselor();
	
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
	 * 테스트결과조회
	 * */
	Psychology selectByCode(Long testCode);

}
