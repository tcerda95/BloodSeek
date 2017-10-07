package laboratorioC.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import laboratorioC.model.Grantee;
import laboratorioC.persistence.GranteeDao;

@Service
public class GranteeServiceImpl implements GranteeService {

	@Autowired
	private GranteeDao granteeDao;

	@Override
	public Grantee getGranteeById(int id) {
		return granteeDao.getGranteeById(id);
	}

	@Override
	public List<Grantee> getGranteeList() {
		return granteeDao.getGrantees();
	}
	
	
	
}
