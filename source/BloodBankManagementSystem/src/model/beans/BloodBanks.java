package model.beans;

public class BloodBanks {
	private String bb_email,bb_name,bb_contact;
	//default const.
	public BloodBanks() {
		super();
		// TODO Auto-generated constructor stub
	}
	//Param const.
	public BloodBanks(String bb_email, String bb_name, String bb_contact) {
		super();
		this.bb_email = bb_email;
		this.bb_name = bb_name;
		this.bb_contact = bb_contact;
	}
	//Getter Setters
	public String getBb_email() {
		return bb_email;
	}

	public void setBb_email(String bb_email) {
		this.bb_email = bb_email;
	}

	public String getBb_name() {
		return bb_name;
	}

	public void setBb_name(String bb_name) {
		this.bb_name = bb_name;
	}

	public String getBb_contact() {
		return bb_contact;
	}

	public void setBb_contact(String bb_contact) {
		this.bb_contact = bb_contact;
	}
	//toString
	@Override
	public String toString() {
		return "BloodBanks [bb_email=" + bb_email + ", bb_name=" + bb_name + ", bb_contact=" + bb_contact + "]";
	}
	
	
	
}
