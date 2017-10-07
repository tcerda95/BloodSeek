package laboratorioC.webappBS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import laboratorioC.model.Grantee;
import laboratorioC.service.GranteeService;
import laboratorioC.webappBS.form.CreateForm;

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
	
	@RequestMapping(value = "/create", method = { RequestMethod.GET })
	public ModelAndView create() {
		return new ModelAndView("create");
	}
	
	@RequestMapping(value = "/create", method = { RequestMethod.POST })
	public ModelAndView create(@ModelAttribute("createForm") final CreateForm createUserForm) {
		
		Grantee grantee;
		
		//Tomar los datos del formulario y registrar el grantee
		//grantee = gs....()....
		
		return new ModelAndView("redirect:/"); //deberia ir a la publicacion .. return new ModelAndView("redirect:/donation/" + grantee.getId())
		
		
	}
}
