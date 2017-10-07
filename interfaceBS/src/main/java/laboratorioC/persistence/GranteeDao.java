package laboratorioC.persistence;

import java.util.List;

import laboratorioC.model.BloodType;
import laboratorioC.model.Grantee;

public interface GranteeDao {
	Grantee getGranteeById(int id);
	List<Grantee> getGrantees();
	Grantee createGrantee(String name, String description, String password, BloodType bloodType, String hospitalAddress, 
			int age, int donorsNeeded);
}
