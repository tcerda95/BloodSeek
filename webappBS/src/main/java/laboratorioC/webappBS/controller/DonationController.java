package laboratorioC.webappBS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import laboratorioC.model.Grantee;
import laboratorioC.service.GranteeService;

@Controller
public class DonationController {

	@Autowired
	private GranteeService gs;
	
	@RequestMapping("/donation/{id}")
	public ModelAndView profile(@PathVariable final int id) {
		
		ModelAndView mav = new ModelAndView("donation");
		
		Grantee grantee = gs.getGranteeById(id);
		
		mav.addObject("grantee",grantee);
		
		return null;
		
	}
}
