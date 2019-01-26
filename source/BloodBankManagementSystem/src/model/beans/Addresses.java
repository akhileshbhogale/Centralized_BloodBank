package model.beans;

public class Addresses {
	private int address_id,type_id;
	private String email,address,city;
	
	public Addresses() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Addresses(int address_id, int type_id, String email, String address, String city) {
		super();
		this.address_id = address_id;
		this.type_id = type_id;
		this.email = email;
		this.address = address;
		this.city = city;
	}

	public int getAddress_id() {
		return address_id;
	}

	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}

	public int getType_id() {
		return type_id;
	}

	public void setType_id(int type_id) {
		this.type_id = type_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Override
	public String toString() {
		return "Addresses [address_id=" + address_id + ", type_id=" + type_id + ", email=" + email + ", address="
				+ address + ", city=" + city + "]";
	}
	
	
}
