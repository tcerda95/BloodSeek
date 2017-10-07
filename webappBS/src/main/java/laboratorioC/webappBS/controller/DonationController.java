package laboratorioC.webappBS.controller;

import java.util.ArrayList;
import java.util.List;

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
import laboratorioC.service.HospitalService;
import laboratorioC.webappBS.form.CreateForm;
import laboratorioC.webappBS.form.HospitalForm;

@Controller
public class DonationController {

	@Autowired
	private GranteeService gs;
	
	@Autowired
	private HospitalService hs;
	
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

		for (HospitalForm form : createForm.getHospitals())
			if (form != null && form.getName() != null && form.getName().length() > 0)
				hs.createHospital(form.getName(), form.getAddress(), form.getLatitude(), form.getLongitude());
		
		grantee = gs.createGrantee(createForm.getName(), createForm.getDescription(), createForm.getPassword(),
				createForm.getBloodType(), extractAddresses(createForm), createForm.getAge(), createForm.getDonorsNeeded());
		
		System.out.println(createForm.getName());
		System.out.println(createForm.getBloodType());
		
		return new ModelAndView("redirect:/donation/" + grantee.getId());
	}
	
	private List<String> extractAddresses(final CreateForm createForm) {
		final List<String> ans = new ArrayList<>();
		
		for (HospitalForm form : createForm.getHospitals())
			if (form != null && form.getName() != null && form.getName().length() > 0)
				ans.add(form.getAddress());
		
		return ans;
	}
}
