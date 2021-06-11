package bu.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/psy")
public class PsychologyController {

	//서비스주비
	
	/**
	 * 테스트
	 * */
	@RequestMapping("/test")
	public void test() {}
	
	/**
	 * 심리테스트목록
	 * */
	@RequestMapping("/list")
	public void list() {}
	
	/**
	 * 우울증테스트
	 * */
	@RequestMapping("/depression")
	public void depression() {}
	
	
}
