package laboratorioC.service;

import java.util.List;

import laboratorioC.model.Grantee;

public interface GranteeService {
	Grantee getGranteeById(int id);
	
	List<Grantee> getGranteeList();
}
