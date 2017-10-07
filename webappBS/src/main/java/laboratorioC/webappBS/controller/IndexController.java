package laboratorioC.webappBS.controller;

import laboratorioC.model.BloodType;
import laboratorioC.model.Grantee;
import laboratorioC.model.Hospital;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import laboratorioC.service.GranteeService;

import java.util.ArrayList;
import java.util.List;

@Controller
public class IndexController {
	
	@Autowired
	private GranteeService gs;
	
	@RequestMapping("/")
	public ModelAndView index() {
		final ModelAndView mav = new ModelAndView("index");

		Hospital h1 = new Hospital(1, "Hospital Alemán", "Dir", 56.0f, 65.0f);
		Hospital h2 = new Hospital(1, "Hospital Ruso", "Dir", 56.0f, 65.0f);
		List<Hospital> hospitals = new ArrayList<Hospital>();
		hospitals.add(h1);
		hospitals.add(h2);

		Grantee g = new Grantee(0, "Pedro", "descr", "asdasd", null,
				hospitals, 21, 50, 35);

		List<Grantee> l = new ArrayList<>();
		//l.add(g);
		mav.addObject("grantees",l);
//		mav.addObject("grantees",gs.getGranteeList());

		return mav;
		
	}

	@RequestMapping("/help")
	public ModelAndView help() {
		return new ModelAndView("help");
	}
}
