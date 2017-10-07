package laboratorioC.model;

import java.util.ArrayList;
import java.util.List;

public enum BloodType {
	O_MINUS("O-", new String[] {"O_MINUS"}),
	O_PLUS("O+", new String[] {"O_MINUS", "O_PLUS"}),
	A_MINUS("A-", new String[] {"O_MINUS", "A_MINUS"}),
	A_PLUS("A+", new String[] {"O_MINUS", "O_PLUS", "A_MINUS", "A_PLUS"}),
	B_MINUS("B-", new String[] {"O_MINUS", "B_MINUS"}),
	B_PLUS("B+", new String[] {"O_MINUS", "O_PLUS", "B_MINUS", "B_PLUS"}),
	AB_MINUS("AB-", new String[] {"O_MINUS", "A_MINUS", "B_MINUS", "AB_MINUS"}),
	AB_PLUS("AB+", new String[] {"O_MINUS", "O_PLUS", "A_MINUS", "A_PLUS", "B_MINUS", "B_PLUS", "AB_MINUS", "AB_PLUS"});
	
	private final String name;
	private final List<String> acceptedBloodTypes = new ArrayList<>();
	
	private BloodType(final String name, final String[] acceptedDonors) {
		this.name = name;
		
		for (final String str : acceptedDonors)
			acceptedBloodTypes.add(str);
	}
	
	public List<BloodType> getAcceptedBloodTypes() {
		final List<BloodType> ans = new ArrayList<>();
		
		for (String str : acceptedBloodTypes)
			ans.add(BloodType.valueOf(str));
		
		return ans;
	}
	
	public String getName() {
		return name;
	}
}
