package bu.mvc.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bu.mvc.domain.Art;
import bu.mvc.domain.ArtAnswer;
import bu.mvc.domain.ArtCounselor;
import bu.mvc.domain.Counselor;
import bu.mvc.domain.Member;
import bu.mvc.domain.Psychology;
import bu.mvc.service.PsychologyService;

@Controller
@RequestMapping("/psy")
public class PsychologyController {

	@Autowired
	private PsychologyService psyService;
	
	/**
	 * index
	 * */
	@RequestMapping("/index")
	public void index() {}
	
	/**
	 * 테스트
	 * */
	
	@RequestMapping("/result")
	public void result(Model model /*, @RequestParam(defaultValue = "0") int nowPage*/) {
		//로그인정보 가져오기
		//List<Psychology> list = psyService.selectResult(new Member(41L));
	//	model.addAttribute("list", list);
		Pageable pageable = PageRequest.of(0, 5, Direction.DESC, "testDate");
		Page<Psychology> pageList = psyService.selectResult(new Member(41L),pageable);
		System.out.println("pageList : "+pageList.getContent().size());
		model.addAttribute("pageList", pageList);
		
	}
	
	
	/**
	 * 심리테스트목록
	 * */
	@RequestMapping("/list")
	public void list() {}
	
	/**
	 * 우울증검사지
	 * */
	@RequestMapping("/depression")
	public void depression() {}
	
	/**
	 * 스트레스검사지
	 * */
	@RequestMapping("/stress")
	public void stress() {}
	
	/**
	 * 우울증 결과 등록
	 * */
	@RequestMapping("/depInsert")
	public ModelAndView depInsert(Psychology psychology) {
		System.out.println(psychology.getTotal());
		
		//회원정보가져오기
		psychology.setMember(new Member(41L));
		
		psyService.testInsert(psychology);
		
		int total = psychology.getTotal();
		Long code = psychology.getTestCode();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/psy/depResult");
		mv.addObject("total", total);
		mv.addObject("code", code);
		System.out.println("total : " + total);
		return mv;
	}
	
	/**
	 * 우울증결과페이지 보여주기
	 * 결과페이지만 같고 bl은 다르니까 컨트롤러 다른거 타게 해야한다..! 아 어차피 만들어야 했었네 마이페이지에서 결과 볼 수 있게 오키오키
	 * */
	@RequestMapping("/depResult")
	public void depResult(Model model, Long no) {
		System.out.println("no = " + no);
		Psychology psy = psyService.selectByCode(no);
		int total = psy.getTotal();
		Long code = psy.getTestCode();
		model.addAttribute("total", total);
		model.addAttribute("code", code);
		
	}
	
	/**
	 * 스트레스 결과 등록
	 * */
	@RequestMapping("/stressInsert")
	public ModelAndView stressInsert(Psychology psychology) {
		System.out.println(psychology.getTotal());
		System.out.println(psychology.getTestName());
		
		//회원정보가져오기
		psychology.setMember(new Member(41L));
		
		psyService.testInsert(psychology);
		
		int total = psychology.getTotal();
		Long code = psychology.getTestCode();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("psy/stressResult");
		mv.addObject("total", total);
		mv.addObject("code", code);
		return mv;
	}
	
	/**
	 * 스트레스 결과 페이지
	 * */
	@RequestMapping("/stressResult")
	public void stressResult(Model model, Long no) {
		System.out.println("no = " + no);
		Psychology psy = psyService.selectByCode(no);
		int total = psy.getTotal();
		Long code = psy.getTestCode();
		model.addAttribute("total", total);
		model.addAttribute("code", code);
	}
	
	/**
	 * 그림테스트
	 * */
	@RequestMapping("/art")
	public void art() {}
	
	/**
	 * 그림상담사 목록
	 * */
	@RequestMapping("/artCounselor")
	public ModelAndView artCounselor() {
		List<ArtCounselor> list= psyService.selectArtCounselor();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("psy/artCounselor");
		mv.addObject("list", list);
		return mv;
	}
	
	/**
	 * 그림테스트 요청화면
	 * */
	@RequestMapping("/artTest/{code}")
	public ModelAndView test(@PathVariable Long code) {
		//System.out.println("code : "+code );
		ArtCounselor ac = psyService.selectById(code);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/psy/artTest");
		mv.addObject("ac", ac);
		return mv;
	}
	
	/**
	 * 파일업로드
	 * */
	@RequestMapping("/upload")
	public ModelAndView upload(String name, Long code, MultipartFile file, HttpSession session) {
		//실제 서버에 올려져 있는 경로 구하기
		ServletContext application = session.getServletContext();
		String path = application.getRealPath("/WEB-INF/save"); //저장할 폴더

		//첨부된 파일의 이름
		String fileName = file.getOriginalFilename();
		
		try {
			//파일을 저장(업로드)
			Calendar calendar = Calendar.getInstance();
			Date date = calendar.getTime();
			file.transferTo(new File(path+"/"+name+"_"+new SimpleDateFormat("yyyyMMddHHmm").format(date)+"_"+fileName));
			
			//회원정보 가져오기
			Art art = new Art(null, null, fileName, 0, new Member(82L), new ArtCounselor(code), null);
			psyService.artInsert(art);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/psy/index");
		return mv;
	}
	
	/**
	 * 그림상담사 등록화면
	 * */
	@RequestMapping("/signupArt")
	public void signArt(Model model) {
		//회원정보를 가져와서 그림상담사 등록되어있는지
		Counselor co = psyService.selectByMem(44L);  //그림상담사 등록된 ㅐㅇ
		Counselor c = psyService.selectByMem(21L);//등록 안된애
		ArtCounselor ac = psyService.selectByCounselorCode(c);
		model.addAttribute("info", ac);
	}
	
	/**
	 * 그림상담사 등록
	 * */
	@RequestMapping("/signup")
	public ModelAndView signup(ArtCounselor artCounselor) {
		//로그인한 회원정보를...44L이라고 가정
		Counselor co = psyService.selectByMem(44L);
		artCounselor.setCounselor(co);
		psyService.signup(artCounselor);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/psy/index");
		return mv;
	}
	
	/**
	 * 그림상담사 수정
	 * */
	@RequestMapping("/update")
	public void update(ArtCounselor artCounselor) {
		//회원정보 가지고 오기
		Counselor co = psyService.selectByMem(44L);
		ArtCounselor ac = psyService.selectByCounselorCode(co);
		//업데이트해야된다
	}
	
	/**
	 * 그림상담사 요청조회
	 * */
	@RequestMapping("/requestList")
	public void requestList(Model model, HttpSession session) {
		//로그인한 정보 가져오기 일단 4L이라고 가정..
		Counselor co = psyService.selectByMem(4L);
		ArtCounselor ac = psyService.selectByCounselorCode(co);
		List<Art> list = psyService.selectByCounselor(ac);
		
		model.addAttribute("list", list);
	}
	
	/**
	 * 다운로드
	 * */
	@RequestMapping("/down/{artFile}/{counselor}/{date}")
	public ModelAndView download(@PathVariable String artFile, @PathVariable String counselor, @PathVariable String date , HttpSession session) {
		//다운로드 기능을 담당하는 뷰가 실행될 수 있도록 호출한다(뷰로 갈때 다운로드할 파일정보를 전달한다.)
		String path = session.getServletContext().getRealPath("/WEB-INF/save");
		File file = new File(path+"/"+counselor+"_"+date+"_"+artFile); //다운로드를 할게될 파일객체
				
		return new ModelAndView("downLoadView", "fname", file);  //WEB-INF/views/downLoadView.jsp에서 ${fname}사용한다.
	}
	
	/**
	 * 그림상담답변등록폼
	 * */
	@RequestMapping("/reply/{artCode}")
	public ModelAndView reply(@PathVariable Long artCode) {
		//아 아트를 넘겨줘야 얘 스테이트가 0인지 1인지 알수있구나...!
		Art art = psyService.selectByArtCode(artCode);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("psy/reply");
		mv.addObject("art", art);
		return mv;
	}
	
	/**
	 * 답변등록하기
	 * 1.answer insert
	 * 2.art-> state update 
	 * */
	@RequestMapping("/write")
	public String write(Long artCode, String artAnsContent) {
		psyService.insertAnswer(artCode, artAnsContent);
		return "redirect:/psy/requestList";
	}
	
	/**
	 * 답변조회하기
	 * */
	@RequestMapping("/answerList")
	public void answerList(Model model) {
		//로그인정보 가져오기
		//List<ArtAnswer> list = psyService.selectAnswer(4L);
		//model.addAttribute("list", list);
		List<Art> list = psyService.selectArt(4L);
		model.addAttribute("list", list);
	}
}
