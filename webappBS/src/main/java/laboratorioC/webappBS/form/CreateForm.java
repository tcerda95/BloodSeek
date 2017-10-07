package laboratorioC.webappBS.form;

import laboratorioC.model.BloodType;

public class CreateForm {

	private static final int HOSPITALS = 10;
	
	private String name;
	private String description;
	private String password;
	private BloodType bloodType;
	private int age;
	private int donorsNeeded;
	private HospitalForm[] hospitals = new HospitalForm[HOSPITALS];

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
	public HospitalForm[] getHospitals() {
		return hospitals;
	}
	public void setHospitals(HospitalForm[] hospitals) {
		this.hospitals = hospitals;
	}
	
}
