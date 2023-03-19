package Product;

public class LowStock {
	

	private int productid;
	private String name;
	private String briefdesc;
	private int stock;
	private String image;
	private String retailprice;
	
	public LowStock(int productid, String name, String briefdesc, int stock, String image, String retailprice) {
		super();
		this.productid = productid;
		this.name = name;
		this.briefdesc = briefdesc;
		this.stock = stock;
		this.image = image;
		this.retailprice = retailprice;
	}
	
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBriefdesc() {
		return briefdesc;
	}
	public void setBriefdesc(String briefdesc) {
		this.briefdesc = briefdesc;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getRetailprice() {
		return retailprice;
	}
	public void setRetailprice(String retailprice) {
		this.retailprice = retailprice;
	}

}
