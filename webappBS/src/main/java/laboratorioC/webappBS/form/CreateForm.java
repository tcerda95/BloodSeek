package laboratorioC.webappBS.form;

import laboratorioC.model.BloodType;
import laboratorioC.model.Hospital;

public class CreateForm {

	private int id;
	private String name;
	private String description;
	private String password;
	private BloodType bloodType;
	private String hospital;
	private int age;
	private int donorsNeeded;
	private int actualDonated;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public BloodType getBloodType() {
		return bloodType;
	}
	public void setBloodType(BloodType bloodType) {
		this.bloodType = bloodType;
	}
	public String getHospital() {
		return hospital;
	}
	public void setHospital(String hospital) {
		this.hospital = hospital;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getDonorsNeeded() {
		return donorsNeeded;
	}
	public void setDonorsNeeded(int donorsNeeded) {
		this.donorsNeeded = donorsNeeded;
	}
	public int getActualDonated() {
		return actualDonated;
	}
	public void setActualDonated(int actualDonated) {
		this.actualDonated = actualDonated;
	}
	
	

}
