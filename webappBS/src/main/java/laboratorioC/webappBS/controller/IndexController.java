package laboratorioC.webappBS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import laboratorioC.service.GranteeService;

@Controller
public class IndexController {
	
	@Autowired
	private GranteeService gs;
	
	@RequestMapping("/")
	public ModelAndView index() {
		final ModelAndView mav = new ModelAndView("index");
		
		mav.addObject("grantees",gs.getGranteeList());
		
		return mav;
		
	}

	@RequestMapping("/help")
	public ModelAndView help() {
		return new ModelAndView("help");
	}
}
