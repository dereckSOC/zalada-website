package dbaccess;

public class customerAddress {


	int userid;
	String username;
	String postalcode;
	String firstname;
	String lastname;
	String addressln1;
	String addressln2;
	
	public customerAddress(int userid, String username, String postalcode, String firstname, String lastname,
			String addressln1, String addressln2) {
		super();
		this.userid = userid;
		this.username = username;
		this.postalcode = postalcode;
		this.firstname = firstname;
		this.lastname = lastname;
		this.addressln1 = addressln1;
		this.addressln2 = addressln2;
	}
	
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
	public String getPostalcode() {
		return postalcode;
	}
	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getAddressln1() {
		return addressln1;
	}
	public void setAddressln1(String addressln1) {
		this.addressln1 = addressln1;
	}
	public String getAddressln2() {
		return addressln2;
	}
	public void setAddressln2(String addressln2) {
		this.addressln2 = addressln2;
	}
}
