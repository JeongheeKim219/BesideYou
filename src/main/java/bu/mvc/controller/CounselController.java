package bu.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bu.mvc.domain.Counsel;
import bu.mvc.domain.Counselor;

@Controller
@RequestMapping("/counsel")
public class CounselController {
	
	
	@RequestMapping("/apply012")
	public ModelAndView apply012() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/counsel/apply012");
		mv.addObject("counsel", new Counsel(null, null, new Counselor(17L), 0, 0, null));
		return mv;
	}
}
