package model.beans;

public class Hospitals {
	private String hospital_name,hospital_email,hospital_contact;

	public Hospitals() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Hospitals(String hospital_name, String hospital_email, String hospital_contact) {
		super();
		this.hospital_name = hospital_name;
		this.hospital_email = hospital_email;
		this.hospital_contact = hospital_contact;
	}

	@Override
	public String toString() {
		return "Hospitals [hospital_name=" + hospital_name + ", hospital_email=" + hospital_email
				+ ", hospital_contact=" + hospital_contact + "]";
	}

	public String getHospital_name() {
		return hospital_name;
	}

	public void setHospital_name(String hospital_name) {
		this.hospital_name = hospital_name;
	}

	public String getHospital_email() {
		return hospital_email;
	}

	public void setHospital_email(String hospital_email) {
		this.hospital_email = hospital_email;
	}

	public String getHospital_contact() {
		return hospital_contact;
	}

	public void setHospital_contact(String hospital_contact) {
		this.hospital_contact = hospital_contact;
	}
	
	
}
