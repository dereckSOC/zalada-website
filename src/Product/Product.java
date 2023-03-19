package Product;

public class Product {
	private int productid;
	private String name;
	private String briefDesc;
	private String detailDesc;
	private double costPrice;
	private double retailPrice;
	private int stock;
	private int qty;
	private int categoryID;
	private String category;
	private String image;

	
	public Product (int productid, String name, String briefDesc, double retailPrice, String category, String image, int qty) {
		super();
		
		this.productid = productid;
		this.qty = qty;
		
		this.name = name;
		this.briefDesc = briefDesc;
		this.retailPrice = retailPrice;
		
		this.category = category;
		this.image = image;
		
	}
	

	
	//Product ID
	public int getProductid() {
		return productid;
	}
	
	public void setProductid(int productid) {
		this.productid = productid;
	}

	//Name
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	//Brief Description
	public String getBriefDesc() {
		return briefDesc;
	}
	public void setBriefDesc(String briefDesc) {
		this.briefDesc = briefDesc;
	}
	
	//Detail Description
	public String getDetailDesc() {
		return detailDesc;
	}
	public void setDetailDesc(String detailDesc) {
		this.detailDesc = detailDesc;
	}
	
	//Cost Price
	public double getCostPrice() {
		return costPrice;
	}
	public void setCostPrice(double costPrice) {
		this.costPrice = costPrice;
	}
	
	//Retail Price
	public double getRetailPrice() {
		return retailPrice;
	}
	public void setRetailPrice(double retailPrice) {
		this.retailPrice = retailPrice;
	}
	
	//Stock
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	//Quantity
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.stock = qty;
	}
	
	//Category ID
	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	
	//Category
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	//Image
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}

