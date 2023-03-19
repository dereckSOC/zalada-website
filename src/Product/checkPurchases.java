package Product;

public class checkPurchases {
	

	int userid;
	String username;
	int qty;
	String firstname;
	String lastname;
	
	public checkPurchases(int userid, String username, int qty, String firstname, String lastname) {
		super();
		this.userid = userid;
		this.username = username;
		this.qty = qty;
		this.firstname = firstname;
		this.lastname = lastname;
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
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
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

}
