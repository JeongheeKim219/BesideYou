package bu.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/counsel")
public class CounselController {
	@RequestMapping("/apply012")
	public ModelAndView apply012() {

		return new ModelAndView("/counsel/apply012");
	}
}
