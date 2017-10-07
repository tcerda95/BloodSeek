package laboratorioC.webappBS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import laboratorioC.service.GranteeService;

@Controller
public class HelloWorldController {
	
	@Autowired
	private GranteeService granteeService;
	
	@RequestMapping("/")
	public ModelAndView helloWorld() {
		final ModelAndView mav = new ModelAndView("index");
		mav.addObject("greeting", "BloodSeek");
		mav.addObject("grantee", granteeService.getGrantee());
		return mav;
	}
}
