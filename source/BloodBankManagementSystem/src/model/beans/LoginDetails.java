package model.beans;

public class LoginDetails {
	private int user_type_id;
	private String email,password;
	
	public LoginDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LoginDetails(int user_type_id, String email, String password) {
		super();
		this.user_type_id = user_type_id;
		this.email = email;
		this.password = password;
	}

	@Override
	public String toString() {
		return "LoginDetails [user_type_id=" + user_type_id + ", email=" + email + ", password=" + password + "]";
	}

	public int getUser_type_id() {
		return user_type_id;
	}

	public void setUser_type_id(int user_type_id) {
		this.user_type_id = user_type_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
