package dbaccess;

public class UserAddress {
	private String firstname;
	private String lastname;
	private String phonenumber;
	private String addressLn1;
	private String addressLn2;
	private String city;
	private String country;
	/*
	public UserAddress(String firstname, String lastname, String phonenumber, String addressLn1, String addressLn2, String city, String country, String postalcode) {
		this.firstname = firstname;
		this.lastname = lastname;
		this.phonenumber = phonenumber;
		this.addressLn1 = addressLn1;
		this.addressLn2 = addressLn2;
		this.city = city;
		this.country = country;
		this.postalcode = postalcode;
	}
	*/
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
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getAddressLn1() {
		return addressLn1;
	}
	public void setAddressLn1(String addressLn1) {
		this.addressLn1 = addressLn1;
	}
	public String getAddressLn2() {
		return addressLn2;
	}
	public void setAddressLn2(String addressLn2) {
		this.addressLn2 = addressLn2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getPostalcode() {
		return postalcode;
	}
	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}
	private String postalcode;
}
