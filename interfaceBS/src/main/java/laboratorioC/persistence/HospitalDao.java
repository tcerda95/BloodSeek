package laboratorioC.persistence;

import java.util.List;

import laboratorioC.model.Hospital;

public interface HospitalDao {
	List<Hospital> getHospitalsByName(final String name);
	Hospital getHospitalByAddress(final String address);
	List<Hospital> getHospitals();
	Hospital createHospital(String name, String address, float latitude, float longitude);
}
