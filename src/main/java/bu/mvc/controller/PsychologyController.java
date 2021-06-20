package bu.mvc.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bu.mvc.domain.Art;
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
	 * 심리테스트목록
	 * */
	@RequestMapping("/list")
	public void list() {}
	
	/**
	 * 우울증검사지
	 * */
	@RequestMapping("/lo/depression")
	public String depression() {
		return "/psy/depression";
	}
	
	/**
	 * 스트레스검사지
	 * */
	@RequestMapping("/lo/stress")
	public String stress() {
		return "/psy/stress";
	}
	
	/**
	 * 우울증 결과 등록
	 * */
	@RequestMapping("/lo/depInsert")
	public ModelAndView depInsert(HttpServletRequest request, Psychology psychology) {
		System.out.println(psychology.getTotal());
		
		//회원정보가져오기
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		psychology.setMember(new Member(member.getMemberCode()));
		
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
	@RequestMapping("/lo/stressInsert")
	public ModelAndView stressInsert(HttpServletRequest request, Psychology psychology) {
		System.out.println(psychology.getTotal());
		System.out.println(psychology.getTestName());
		
		//회원정보가져오기
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		psychology.setMember(new Member(member.getMemberCode()));
		
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
	 * 심리테스트 결과목록
	 * */
	@RequestMapping("/lo/result")
	public String result(HttpServletRequest request, Model model , @RequestParam(defaultValue = "1") int nowPage) {
		//로그인정보 가져오기
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Pageable pageable = PageRequest.of((nowPage-1), 10, Direction.DESC, "testDate");
		
		Page<Psychology> pageList = psyService.selectResult(new Member(member.getMemberCode()),pageable);
		
		int blockCount = 5;
		int temp = (nowPage-1) % blockCount;
		int startPage = nowPage - temp;
		
		//System.out.println("pageList : "+pageList.getContent().size());
		model.addAttribute("pageList", pageList);
		model.addAttribute("blockCount", blockCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
		return "/psy/result";
	}
	
	/**
	 * 그림테스트
	 * */
	@RequestMapping("/art")
	public void art() {
		//return "/psy/art";
	}
	
	/**
	 * 그림상담사 목록
	 * */
	@RequestMapping("/lo/artCounselor")
	public String artCounselor(Model model , @RequestParam(defaultValue = "1") int nowPage) {
		Pageable pageable = PageRequest.of((nowPage-1), 6, Direction.ASC, "artCounselorCode");
		Page<ArtCounselor> list= psyService.selectArtCounselor(pageable);
		
		int blockCount = 5;
		int temp = (nowPage-1) % blockCount;
		int startPage = nowPage - temp;
		
		model.addAttribute("list", list);
		model.addAttribute("blockCount", blockCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
		return "/psy/artCounselor";
	}
	
	/**
	 * 그림테스트 요청화면
	 * */
	@RequestMapping("/lo/artTest/{code}")
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
	@RequestMapping("/lo/upload")
	public ModelAndView upload(HttpServletRequest request, String name, Long code, MultipartFile file, HttpSession session) {
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
			Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			Art art = new Art(null, null, fileName, 0, new Member(member.getMemberCode()), new ArtCounselor(code), null);
			psyService.artInsert(art);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/index");
		return mv;
	}
	
	/**
	 * 그림상담사 등록화면
	 * */
	@RequestMapping("/lo/signupArt")
	public String signArt(HttpServletRequest request, Model model) {
		//회원정보를 가져와서 그림상담사 등록되어있는지
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Counselor co = psyService.selectByMem(member.getMemberCode());
		if(co.getCounselorState()!=1) {
			model.addAttribute("co", co);
			return "/psy/signupArt";
		}
		ArtCounselor ac = psyService.selectByCounselorCode(psyService.selectByMem(member.getMemberCode()));
		model.addAttribute("info", ac);
		return "/psy/signupArt";
	}
	
	/**
	 * 그림상담사 등록
	 * */
	@RequestMapping("/lo/signup")
	public ModelAndView signup(HttpServletRequest request, ArtCounselor artCounselor) {
		//로그인한 회원정보를...66L이라고 가정
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Counselor co = psyService.selectByMem(member.getMemberCode());
		//Member mem = new Member(member.getMemberCode());
		//Counselor co= new Counselor(mem.getMemberCode());
		artCounselor.setCounselor(co);
		
		//등록전에 입력한데이터 태그있는지 체크
		String question = artCounselor.getQuestion().replace("<", "&lt;");
		artCounselor.setQuestion(question);
		String detail = artCounselor.getDetail().replace("<", "&lt;");
		artCounselor.setDetail(detail);
		
		psyService.signup(artCounselor);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/index");
		return mv;
	}
	
	/**
	 * 그림상담사 수정
	 * */
	@RequestMapping("/lo/update")
	public ModelAndView update(HttpServletRequest request, ArtCounselor artCounselor) {
		//회원정보 가지고 오기
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		psyService.updateQD(member.getMemberCode(), artCounselor);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/index");
		return mv;
	}
	
	/**
	 * 그림상담사 요청조회
	 * */
	@RequestMapping("/lo/requestList")
	public String requestList(HttpServletRequest request, Model model, HttpSession session) {
		//로그인한 정보 가져오기 일단 4L이라고 가정..
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Member mem = new Member(member.getMemberCode());
		//System.out.println("member : "+member.getMemberCode());
		//멤버코드로 카운슬러코드 찾기
		Counselor co = psyService.selectByMem(member.getMemberCode());
		if(co.getCounselorState()!=1) {
			model.addAttribute("co", co);
			return "/psy/requestList";
		}
		//카운슬러코드로 아트카운슬러 찾기
		ArtCounselor ac = psyService.selectByCounselorCode(co);
		
		List<Art> list= psyService.selectByCounselor(co);
		
		model.addAttribute("list", list);
		model.addAttribute("ac", ac);
		return "/psy/requestList";
	}
	
	/**
	 * 다운로드
	 * */
	@RequestMapping("/lo/down/{artFile}/{counselor}/{date}")
	public ModelAndView download(@PathVariable String artFile, @PathVariable String counselor, @PathVariable String date , HttpSession session) {
		//다운로드 기능을 담당하는 뷰가 실행될 수 있도록 호출한다(뷰로 갈때 다운로드할 파일정보를 전달한다.)
		String path = session.getServletContext().getRealPath("/WEB-INF/save");
		File file = new File(path+"/"+counselor+"_"+date+"_"+artFile); //다운로드를 할게될 파일객체
				
		return new ModelAndView("downLoadView", "fname", file);  //WEB-INF/views/downLoadView.jsp에서 ${fname}사용한다.
	}
	
	/**
	 * 그림상담답변등록폼
	 * */
	@RequestMapping("/lo/reply/{artCode}")
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
	@RequestMapping("/lo/write")
	public String write(Long artCode, String artAnsContent) {
		psyService.insertAnswer(artCode, artAnsContent);
		return "redirect:/psy/lo/requestList";
	}
	
	/**
	 * 답변조회하기
	 * */
	@RequestMapping("/lo/answerList")
	public String answerList(HttpServletRequest request, Model model) {
		//로그인정보 가져오기
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//List<ArtAnswer> list = psyService.selectAnswer(4L);
		//model.addAttribute("list", list);
		List<Art> list = psyService.selectArt(member.getMemberCode());
		model.addAttribute("list", list);
		return "/psy/answerList";
	}
	
	/**
	 * 그림상담사 해지페이지
	 * */
	@RequestMapping("/lo/cancle")
	public String cancle(HttpServletRequest request, Model model) {
		//로그인정보 가져오기
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//멤버가 상담사인지 아닌지
		Counselor co = psyService.selectByMem(member.getMemberCode());
		if(co.getCounselorState()!=1) {
			model.addAttribute("co", co);
			return "/psy/cancle";
		}
		//그림상담사인지 안닌지
		ArtCounselor ac = psyService.selectByCounselorCode(co);
		model.addAttribute("ac", ac);
		return "/psy/cancle";
	}
	
	/**
	 * 그림상담사 해지
	 * */
	@RequestMapping("/lo/stateUpdate")
	public String stateUpdate(HttpServletRequest request) {
		//로그인정보 가져오기
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		psyService.updateState(member.getMemberCode());
		return "/index";
	}
	
	/**
	 * 에러페이지
	 * */
	@ExceptionHandler(RuntimeException.class)
	public ModelAndView error(RuntimeException e) {
		return new ModelAndView("member/errorView", "errMsg",e.getMessage());
	}
}
