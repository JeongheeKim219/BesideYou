package bu.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bu.mvc.domain.Counsel;
import bu.mvc.domain.Counselor;
import bu.mvc.domain.RequestAns;
import bu.mvc.domain.Requests;
import bu.mvc.service.RequestService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/requests")
public class RequestsController {
	
	private final RequestService requestService;
	
	//counselCode를 이용하여 request찾아오기
	@RequestMapping("/read")
	public ModelAndView readRequests(Long counselCode) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/requests/read");
		
		Counsel counsel = requestService.getCounsel(counselCode);
		Requests requests = requestService.read(counsel);
		RequestAns requestAns = requestService.getAnswer(requests);
		mv.addObject("requests",requests);
		mv.addObject("counsel", counsel);
		mv.addObject("requestAns", requestAns);
		return mv;
	}
	
	@RequestMapping("/seeDetail")
	public ModelAndView seeDetail(Long counselCode) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/requests/detail");
		
		Counsel counsel = requestService.getCounsel(counselCode);
		Requests requests = requestService.read(counsel);
		RequestAns requestAns = requestService.getAnswer(requests);
		
		mv.addObject("requests", requests);
		mv.addObject("counsel", counsel);
		mv.addObject("requestAns",requestAns);
		return mv;
	}
	
	@RequestMapping("/addAns")
	public String addAns(Long requestCode, String requestAnsContent) {
		Requests requests = requestService.getRequests(requestCode);
		Counselor counselor = requests.getCounsel().getCounselor();
		RequestAns requestAns = new RequestAns(null, requests, counselor, requestAnsContent);
		
		requestService.addAns(requestAns);
		
		return "redirect:/counsel/listForCounselor?field=3";
	}
}
