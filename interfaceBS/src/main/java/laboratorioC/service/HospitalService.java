package laboratorioC.service;

import java.util.List;

import laboratorioC.model.Hospital;

public interface HospitalService {
	List<Hospital> getHospitalsByName(final String name);
	Hospital getHospitalByAddress(final String address);
	List<Hospital> getHospitals();
	Hospital createHospital(String name, String address, float latitude, float longitude);
}
