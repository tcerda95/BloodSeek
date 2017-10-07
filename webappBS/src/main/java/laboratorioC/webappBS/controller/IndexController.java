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
	public ModelAndView index(@RequestParam(value="bloodType", required = false) final String acceptedBlood,
							  @RequestParam(value="long", required = false) final Double longitude,
							  @RequestParam(value="lat", required = false) final Double latitude) {
		final ModelAndView mav = new ModelAndView("index");

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
		} else {
			l = grantees;
		}

		mav.addObject("grantees",l);

		return mav;
		
	}

	@RequestMapping("/help")
	public ModelAndView help() {
		return new ModelAndView("help");
	}
}
