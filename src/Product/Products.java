package Product;

public class Products {
	private int productid;
	private String name;
	private String briefDesc;
	private String detailDesc;
	private String costPrice;
	private String retailPrice;
	private int stock;
	private int categoryID;
	private String category;
	private String image;

	
	public Products (int productid, String name, String briefDesc, String detaildesc, String costprice, String retailPrice, int stock, int categoryid, String image) {
		super();
		
		this.productid = productid;
		this.name = name;
		this.briefDesc = briefDesc;
		this.detailDesc = detaildesc;
		this.retailPrice = retailPrice;
		this.costPrice = costprice;
		this.categoryID = categoryid;
		this.stock = stock;
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
	public String getCostPrice() {
		return costPrice;
	}
	public void setCostPrice(String costPrice) {
		this.costPrice = costPrice;
	}
	
	//Retail Price
	public String getRetailPrice() {
		return retailPrice;
	}
	public void setRetailPrice(String retailPrice) {
		this.retailPrice = retailPrice;
	}
	
	//Stock
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
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

