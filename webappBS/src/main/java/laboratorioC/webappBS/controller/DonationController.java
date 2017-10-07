package laboratorioC.webappBS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import laboratorioC.model.BloodType;
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
		
		return mav;	
	}
	
   @RequestMapping("/donation")
    public ModelAndView profileTest() {
        
        ModelAndView mav = new ModelAndView("donation");
        
        return mav; 
    }
	
	@RequestMapping(value = "/create", method = { RequestMethod.GET })
	public ModelAndView createGet(@ModelAttribute("createForm") final CreateForm createForm) {
		final ModelAndView mav = new ModelAndView("form");
		mav.addObject("bloodTypes", BloodType.values());
		return mav;
	}
	
	@RequestMapping(value = "/create", method = { RequestMethod.POST })
	public ModelAndView createPost(@ModelAttribute("createForm") final CreateForm createForm) {
		Grantee grantee;
		//Tomar los datos del formulario y registrar al grantee
		//grantee = gs.createGrantee(createForm.getName(), createForm.getDescription(), createForm.getPassword(),
		//		createForm.getBloodType(), createForm.getHospital(), createForm.getAge(), createForm.getDonorsNeeded());
		
		System.out.println(createForm.getName());
		System.out.println(createForm.getBloodType());
		
		return new ModelAndView("redirect:/donation/");
	}
}
