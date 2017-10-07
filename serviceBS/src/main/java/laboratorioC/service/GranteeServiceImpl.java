package laboratorioC.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import laboratorioC.model.Grantee;
import laboratorioC.persistence.GranteeDao;

@Service
public class GranteeServiceImpl implements GranteeService {

	@Autowired
	private GranteeDao granteeDao;

	@Override
	public Grantee getGrantee() {
		return granteeDao.getGrantee();
	}
	
}
