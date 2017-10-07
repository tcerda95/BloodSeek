package laboratorioC.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import laboratorioC.model.Hospital;
import laboratorioC.persistence.HospitalDao;

@Service
public class HospitalServiceImpl implements HospitalService {

	@Autowired
	private HospitalDao hospitalDao;
	
	@Override
	public List<Hospital> getHospitalsByName(String name) {
		return hospitalDao.getHospitalsByName(name);
	}

	@Override
	public Hospital getHospitalByAddress(String address) {
		return hospitalDao.getHospitalByAddress(address);
	}

}
