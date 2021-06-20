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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bu.mvc.domain.Counselor;
import bu.mvc.domain.Member;
import bu.mvc.domain.Price;
import bu.mvc.domain.Speciality;
import bu.mvc.domain.Tag;
import bu.mvc.service.CounselorService;
import bu.mvc.service.MemberService;
import bu.mvc.service.PriceService;
import bu.mvc.service.SpecialityService;
import bu.mvc.service.TagService;


@Controller
@RequestMapping("/counselor")
public class CounselorController {
	
	@Autowired
	private CounselorService counselorService;
	
	@Autowired
	private SpecialityService specialityService;
	
	@Autowired
	private TagService tagService;
	
	@Autowired
	private PriceService priceService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	/**
	 * 신청 폼
	 * */
	@RequestMapping("/CounselorJoin")
	public void joinForm() {
		
	}
	
	/**
	 * 상담사 신청하기
	 * */
	@RequestMapping("/join")
	public ModelAndView join( Counselor counselor, MultipartFile file, HttpSession session, String lat, String longi, 
			 HttpServletRequest request,int price0, int price1,int price2, int price3) {
		
		String tagNames [] = request.getParameterValues("tagName");
	     for(String tagName : tagNames) {
           // System.out.println(tagName);
	     }
	     String spcNames [] = request.getParameterValues("specialityName");
	     for(String spcName : spcNames) {
            //System.out.println(spcName);
	     }
		
		Member me =(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		//System.out.println("here");
		
		double latitude = Double.parseDouble(lat);
		double longitude = Double.parseDouble(longi);
		
		counselor.setLatitude(latitude);
		counselor.setLongitude(longitude);
		//실제 서버에 올려져 있는 경로 구하기
		ServletContext application = session.getServletContext();
		String path = application.getRealPath("/WEB-INF/save"); //저장할 폴더

		int[] prices = new int[4];
		
		prices[0] = price0;
		prices[1] = price1;
		prices[2] = price2;
		prices[3] = price3;
				
		
		
		try {
			//파일을 저장(업로드)
			Calendar calendar = Calendar.getInstance();
			Date date = calendar.getTime();
			String fileName = new SimpleDateFormat("yyyyMMddHHmm").format(date)+"_"+ file.getOriginalFilename();
			
			file.transferTo(new File(path+"/"+fileName));
		
			counselor.setCerificate(fileName);
			counselor.setPicture(fileName);
			counselor.setMember(new Member(me.getMemberCode()));	
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		counselorService.joinCounselor(counselor , tagNames, prices, spcNames);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("counselor/joinSuccess");
		return mv;
		}
	
	
	/**
	 * 상담사 회원 정보
	 * */
	@RequestMapping("/read")
	public ModelAndView read(HttpServletRequest request) {
	
		//System.out.println(memberCode);
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Counselor counselor = counselorService.selectByCounselor(member.getMemberCode());
		//System.out.println(counselor);
		//System.out.println(counselor.getCounselorCode());
		
		
		List<Speciality> speciality = specialityService.selectByCounselor(counselor.getCounselorCode());
		List<Tag> tag = tagService.selectByCounselor(counselor.getCounselorCode());
		List<Price> price = priceService.selectByCounselor(counselor.getCounselorCode());
		//System.out.println(speciality);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("counselor/read");
		mv.addObject("counselor", counselor);
		mv.addObject("speciality",speciality);
		mv.addObject("tag",tag);
		mv.addObject("price", price);
		return mv;
	}
	/**
	 * 상담사 정보 수정 폼
	 * */
	@RequestMapping("/counselorUpdate")
	public ModelAndView updateForm(String password, Long memberCode) {
		Member member = memberService.selectByMember(memberCode);
		if(!passwordEncoder.matches(password, member.getPassword())) {	
			throw new RuntimeException("비밀번호 오류 입니다..");
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("counselor/counselorUpdate");
		return mv;
		
	}
	
	/**
	 * 상담사 정보수정
	 * */
	@RequestMapping("/update")
	public ModelAndView updateCounselor(HttpServletRequest request,Counselor counselor,Speciality speciality,int price0, int price1,int price2, int price3) {
		
		String spcNames [] = request.getParameterValues("specialityName");
	     for(String spcName : spcNames) {
           //System.out.println(spcName);
	     }
	     String tagNames [] = request.getParameterValues("tagName");
	     for(String tagName : tagNames) {
           // System.out.println(tagName);
	     }
	     int[] prices = new int[4];
			
			prices[0] = price0;
			prices[1] = price1;
			prices[2] = price2;
			prices[3] = price3;
	     
		Member me =(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Counselor con = counselorService.selectByCounselor(me.getMemberCode());
			 counselorService.updateCounselor(me.getMemberCode(), counselor,speciality,spcNames,tagNames,prices);
		
			 return new ModelAndView("counselor/updateSuccess");
	}
	
	@RequestMapping("/counselorJoinList")
	public void list(Model model,@RequestParam(defaultValue = "0") int nowPage) {
		Pageable pageble = PageRequest.of(nowPage, 10,Direction.DESC,"counselorCode");// --> dao영역(jap영역에서)전체레코드 수 구해서 /10나누고 전체 페이지 구하고 그 페이지중에서 전달받은 nowPage에 해당하는 레코드만 검색해서 content 검색한다.
		Page<Counselor> pageList = counselorService.selectAll(pageble);
		
		
		
		model.addAttribute("pageList",pageList);//뷰페이지에서 ${pageList.메소드이름}
	}
	
	@ExceptionHandler(RuntimeException.class)
	public ModelAndView error(RuntimeException e) {
		return new ModelAndView("counselor/errorView", "errMsg",e.getMessage());
	}
	
}
