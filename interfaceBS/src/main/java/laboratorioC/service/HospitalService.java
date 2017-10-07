package laboratorioC.service;

import java.util.List;

import laboratorioC.model.Hospital;

public interface HospitalService {
	List<Hospital> getHospitalsByName(final String name);
	Hospital getHospitalByAddress(final String address);
	List<Hospital> getHospitals();
}
