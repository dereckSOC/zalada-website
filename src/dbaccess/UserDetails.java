package dbaccess;

public class UserDetails {
	private int userid;
	private String username;
	private String password;
	private String email;
	private String phonenumber;
	private String role;
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhoneNumber() {
		return this.phonenumber;
	}
	
	public void setPhoneNumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}


}
