package laboratorioC.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import laboratorioC.model.BloodType;
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

	@Override
	public Grantee createGrantee(String name, String description, String password, BloodType bloodType,
			String hospitalAddress, int age, int donorsNeeded) {
		return granteeDao.createGrantee(name, description, password, bloodType, hospitalAddress, age, donorsNeeded);
	}
}
