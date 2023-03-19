package dbaccess;

public class OrderList {
	//product
	private int productid;
	private int qty;
	private String receiptid;
	private String productprice;
	private String shippingFee;

	//address
	private String email;
	private String phonenumber;
	private String firstname;
	private String lastname;
	private String phonenumber2;
	private String addressln1;
	private String addressln2;
	private String city;
	private String country;
	private String postalcode;	

	public OrderList(int productid, int qty, String receiptid, String productprice, String shippingFee, String email, String phonenumber, String firstname, String lastname, String phonenumber2, String addressLn1, String addressLn2, String city, String country, String postalcode) {
		//product
		this.productid = productid;
		this.qty = qty;
		this.receiptid = receiptid;
		this.productprice = productprice;
		this.shippingFee = shippingFee;
		
		//address
		this.email = email;
		this.phonenumber = phonenumber;
		this.firstname = firstname;
		this.lastname = lastname;
		this.phonenumber2 = phonenumber2;
		this.addressln1 = addressLn1;
		this.addressln2 = addressLn2;
		this.city = city;
		this.country = country;
		this.postalcode = postalcode;
	}
	
	public void OrderListSummary (int productid, int qty, String receiptid, String productprice, String shippingFee) {
		this.productid = productid;
		this.qty = qty;
		this.receiptid = receiptid;
		this.productprice = productprice;
		this.shippingFee = shippingFee;
	}
	
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getReceiptid() {
		return receiptid;
	}
	public void setReceiptid(String receiptid) {
		this.receiptid = receiptid;
	}
	public String getProductprice() {
		return productprice;
	}
	public void setProductprice(String productprice) {
		this.productprice = productprice;
	}
	public String getShippingFee() {
		return shippingFee;
	}
	public void setShippingFee(String shippingFee) {
		this.shippingFee = shippingFee;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
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
	public String getPhonenumber2() {
		return phonenumber2;
	}
	public void setPhonenumber2(String phonenumber2) {
		this.phonenumber2 = phonenumber2;
	}
	public String getAddressln1() {
		return addressln1;
	}
	public void setAddressnl1(String addressln1) {
		this.addressln1 = addressln1;
	}
	public String getAddressln2() {
		return addressln2;
	}
	public void setAddressln2(String addressln2) {
		this.addressln2 = addressln2;
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
}