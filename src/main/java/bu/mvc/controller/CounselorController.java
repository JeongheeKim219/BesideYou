package bu.mvc.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bu.mvc.domain.Counselor;
import bu.mvc.domain.Member;
import bu.mvc.service.CounselorService;

@Controller
@RequestMapping("/counselor")
public class CounselorController {
	
	@Autowired
	private CounselorService counselorService;
	
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
	public ModelAndView join(Counselor counselor, MultipartFile file, HttpSession session, String lat, String longi) {
		Member me =(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("here");
		
		double latitude = Double.parseDouble(lat);
		double longitude = Double.parseDouble(longi);
		
		counselor.setLatitude(latitude);
		counselor.setLongitude(longitude);
		//실제 서버에 올려져 있는 경로 구하기
		ServletContext application = session.getServletContext();
		String path = application.getRealPath("/WEB-INF/save"); //저장할 폴더

		
		try {
			//파일을 저장(업로드)
			Calendar calendar = Calendar.getInstance();
			Date date = calendar.getTime();
			String fileName = new SimpleDateFormat("yyyyMMddHHmm").format(date)+"_"+ file.getOriginalFilename();
			
			file.transferTo(new File(path+"/"+fileName));
		
			
			counselor.setPicture(fileName);
			counselor.setMember(new Member(me.getMemberCode()));			
			counselorService.joinCounselor(counselor);
		}catch(Exception e) {
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("counselor/joinSuccess");
		return mv;
		}
}
