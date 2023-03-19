package Product;

public class ProductOrder {
	private int productid;
	private String name;
	private String briefDesc;
	private String detailDesc;
	private int category;
	private String image;
	
	public ProductOrder (int productid, String name, String briefdesc, String detaildesc, int categoryid, String image) {
		super();
		this.productid = productid;
		this.name = name;
		this.briefDesc = briefdesc;
		this.detailDesc = detaildesc;
		this.category = categoryid;
		this.image = image;
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

	public String getBriefDesc() {
		return briefDesc;
	}

	public void setBriefDesc(String briefDesc) {
		this.briefDesc = briefDesc;
	}

	public String getDetailDesc() {
		return detailDesc;
	}

	public void setDetailDesc(String detailDesc) {
		this.detailDesc = detailDesc;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
}
