package dbaccess;

public class OrderDate {


	private int orderid;
	private String productprice;
	private String createTime;
	private String username;
	private String firstname;
	private String lastname;
	private int productid;
	private String receipt;
	
	public OrderDate(int orderid, int productid, String productprice, String createTime, String username, String firstname,
			String lastname, String receipt) {
		super();
		this.orderid = orderid;
		this.productid = productid;
		this.productprice = productprice;
		this.createTime = createTime;
		this.username = username;
		this.firstname = firstname;
		this.lastname = lastname;
		this.receipt = receipt;
		
	}
	
	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public String getReceipt() {
		return receipt;
	}

	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}
	
	
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public String getProductprice() {
		return productprice;
	}
	public void setProductprice(String productprice) {
		this.productprice = productprice;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
