package model.beans;

public class CampRegistrations {
	private int camp_id;
	private String user_email;
	//Default const.
	public CampRegistrations() {
		super();
		// TODO Auto-generated constructor stub
	}
	//param const.
	public CampRegistrations(int camp_id, String user_email) {
		super();
		this.camp_id = camp_id;
		this.user_email = user_email;
	}
	//toString
	@Override
	public String toString() {
		return "CampRegistrations [camp_id=" + camp_id + ", user_email=" + user_email + "]";
	}
	//Getter Setters
	public int getCamp_id() {
		return camp_id;
	}

	public void setCamp_id(int camp_id) {
		this.camp_id = camp_id;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	
	
	
	
}
