package laboratorioC.webappBS.controller;

import laboratorioC.model.BloodType;
import laboratorioC.model.Grantee;
import laboratorioC.model.Hospital;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import laboratorioC.service.GranteeService;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
public class IndexController {
	
	@Autowired
	private GranteeService gs;
	
	@RequestMapping("/")
	public ModelAndView index(@RequestParam(value="bloodType", required = false) final String acceptedBlood) {
		final ModelAndView mav = new ModelAndView("index");

		Hospital h1 = new Hospital(1, "Hospital Alemán", "Dir", 56.0f, 65.0f);
		Hospital h2 = new Hospital(1, "Hospital Ruso", "Dir", 56.0f, 65.0f);
		List<Hospital> hospitals = new ArrayList<Hospital>();
		hospitals.add(h1);
		hospitals.add(h2);

		Grantee g = new Grantee(0, "Pedro", "descr", "asdasd", BloodType.A_PLUS,
				hospitals, 21, 50, 35);

		List<Grantee> testList = new ArrayList<>();
		testList.add(g);

		List<BloodType> accBlood = new ArrayList<>();
		if (acceptedBlood != null) {
			for (char c: acceptedBlood.toCharArray()) {
				switch (c) {
					case 'O':
						accBlood.add(BloodType.O_PLUS);
						break;
					case 'o':
						accBlood.add(BloodType.O_MINUS);
						break;
					case 'A':
						accBlood.add(BloodType.A_PLUS);
						break;
					case 'a':
						accBlood.add(BloodType.A_MINUS);
						break;
					case 'B':
						accBlood.add(BloodType.B_PLUS);
						break;
					case 'b':
						accBlood.add(BloodType.B_MINUS);
						break;
					case 'C':
						accBlood.add(BloodType.AB_PLUS);
						break;
					case 'c':
						accBlood.add(BloodType.AB_MINUS);
						break;
				}
			}
		}

		List<Grantee> grantees = gs.getGranteeList();
		List<Grantee> l = new ArrayList<>();

		if (!accBlood.isEmpty()) {
			for (Grantee gr: grantees) {
				if (!Collections.disjoint(accBlood, gr.getAcceptedDonors())) {
					l.add(gr);
				}
			}
		}

		mav.addObject("grantees",l);
//		mav.addObject("grantees",gs.getGranteeList());

		return mav;
		
	}

	@RequestMapping("/help")
	public ModelAndView help() {
		return new ModelAndView("help");
	}
}
