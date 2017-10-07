package laboratorioC.persistence;

import java.util.List;

import laboratorioC.model.Grantee;

public interface GranteeDao {
	Grantee getGranteeById(int id);
	List<Grantee> getGrantees();
}
