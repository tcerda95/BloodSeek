package laboratorioC.model;

import java.util.ArrayList;
import java.util.List;

public enum BloodType {
	O_MINUS(new String[] {"O_MINUS"}),
	O_PLUS(new String[] {"O_MINUS", "O_PLUS"}),
	A_MINUS(new String[] {"O_MINUS", "A_MINUS"}),
	A_PLUS(new String[] {"O_MINUS", "O_PLUS", "A_MINUS", "A_PLUS"}),
	B_MINUS(new String[] {"O_MINUS", "B_MINUS"}),
	B_PLUS(new String[] {"O_MINUS", "O_PLUS", "B_MINUS", "B_PLUS"}),
	AB_MINUS(new String[] {"O_MINUS", "A_MINUS", "B_MINUS", "AB_MINUS"}),
	AB_PLUS(new String[] {"O_MINUS", "O_PLUS", "A_MINUS", "A_PLUS", "B_MINUS", "B_PLUS", "AB_MINUS", "AB_PLUS"});
	
	private List<BloodType> acceptedBloodTypes = new ArrayList<>();
	
	private BloodType(final String[] acceptedDonors) {
		for (final String str : acceptedDonors)
			acceptedBloodTypes.add(BloodType.valueOf(str));
	}
	
	public List<BloodType> getAcceptedBloodTypes() {
		return acceptedBloodTypes;
	}
}
