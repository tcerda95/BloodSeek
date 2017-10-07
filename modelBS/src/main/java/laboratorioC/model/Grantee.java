package laboratorioC.model;

import java.util.List;

public class Grantee {
	private final int id;
	private final String name;
	private final String description;
	private final String password;
	private final BloodType bloodType;
	private List<Hospital> hospitals;
	private final int age;
	private final int donorsNeeded;
	private final int actualDonated;
	
	public Grantee(final int id, final String name, final String description, final String password, final BloodType bloodType, final List<Hospital> hospitals, 
			final int age, final int donorsNeeded, final int actualDonated) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.password = password;
		this.bloodType = bloodType;
		this.hospitals = hospitals;
		this.age = age;
		this.donorsNeeded = donorsNeeded;
		this.actualDonated = actualDonated;
	}

	public List<BloodType> getAcceptedDonors() {
		return bloodType.getAcceptedBloodTypes();
	}
	
	public int getId() {
		return id;
	}
	
	public String getName() {
		return name;
	}

	public String getDescription() {
		return description;
	}

	public String getPassword() {
		return password;
	}

	public BloodType getBloodType() {
		return bloodType;
	}

	public List<Hospital> getHospitals() {
		return hospitals;
	}

	public int getAge() {
		return age;
	}

	public int getDonorsNeeded() {
		return donorsNeeded;
	}

	public int getActualDonated() {
		return actualDonated;
	}

	@Override
	public int hashCode() {
		return id;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		
		if (!(obj instanceof Grantee))
			return false;
		
		Grantee other = (Grantee) obj;
		
		return other.id == this.id;
	}
	
	@Override
	public String toString() {
		return this.name;
	}

	public void setHospitals(List<Hospital> hospitals) {
		this.hospitals = hospitals;
	}
}
