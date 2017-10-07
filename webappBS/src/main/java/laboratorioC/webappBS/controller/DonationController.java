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
import laboratorioC.model.Hospital;
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
		
		mav.addObject("grantee", grantee);
		mav.addObject("donorBloodTypes", grantee.getAcceptedDonors());
		mav.addObject("hospitalsAvailable", grantee.getHospitals());
		return mav;	
	}
	
   @RequestMapping("/donation")
    public ModelAndView profileTest() {
        
        ModelAndView mav = new ModelAndView("donation");
        
        List<Hospital> hospitals = new ArrayList<>();
        hospitals.add(new Hospital(1, "Hospital de Niños", "Montes de oca 380", 43, 43));
        hospitals.add(new Hospital(2, "Hospital de Viejos", "Montes de oca 381", 41, -43));
        hospitals.add(new Hospital(3, "Hospital de Animales", "Montes de oca 100", -43, 43));
        
        Grantee grantee = new Grantee(1, "Luciano Bianchi", "Dame sangre o me muero soy re buena persona y estudio mucho", 
                "abcd", BloodType.A_PLUS, hospitals, 21, 32, 10);
                
        mav.addObject("grantee", grantee);
        mav.addObject("donorBloodTypes", grantee.getAcceptedDonors());
        mav.addObject("hospitalsAvailable", grantee.getHospitals());
        
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
