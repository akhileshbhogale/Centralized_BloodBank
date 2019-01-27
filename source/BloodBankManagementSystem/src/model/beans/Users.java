package model.beans;

public class Users {
	private String user_email,user_name,user_contact;

	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Users(String user_email, String user_name, String user_contact) {
		super();
		this.user_email = user_email;
		this.user_name = user_name;
		this.user_contact = user_contact;
	}

	@Override
	public String toString() {
		return "Users [user_email=" + user_email + ", user_name=" + user_name + ", user_contact=" + user_contact + "]";
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_contact() {
		return user_contact;
	}

	public void setUser_contact(String user_contact) {
		this.user_contact = user_contact;
	}
	
}
