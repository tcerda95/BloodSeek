package laboratorioC.service;

import java.util.List;

import laboratorioC.model.BloodType;
import laboratorioC.model.Grantee;

public interface GranteeService {
	Grantee getGranteeById(int id);
	List<Grantee> getGranteeList();
	Grantee createGrantee(String name, String description, String password, BloodType bloodType, String hospitalAddress, 
			int age, int donorsNeeded);
}
