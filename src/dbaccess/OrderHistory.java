package dbaccess;
import java.sql.*;
import java.util.ArrayList;
import Product.*;

public class OrderHistory {
	
	//Gets ReceiptID and removes duplicates
	public static ArrayList<String> ReceiptIDList(int userid) {
		String receiptid, receiptidHolder="";
		ArrayList<String> receiptList = new ArrayList<String>();
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew, "root", "root");
			Statement stmt = conn.createStatement();
			String sqlStr = "Select receiptid FROM zalada.orders WHERE userid ='" + userid + "' ORDER BY orderid DESC";
			ResultSet rs = stmt.executeQuery(sqlStr);
			
			
			while(rs.next()){
				receiptid = rs.getString("receiptid");
				
				//Check for duplicates
				if(receiptidHolder.contentEquals(receiptid)) {
				} else {
					receiptidHolder = receiptid;
					receiptList.add(receiptid);
				}
			}
			conn.close();
			
		} catch(Exception e){
			System.out.println("Error: " + e);
		}
		
		return receiptList;
	}
	
	
	public static ArrayList<OrderList> getOrders(String receiptid) {
		ArrayList<OrderList> orderList = new ArrayList<OrderList>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew, "root", "root");
			Statement stmt = conn.createStatement();
			String sqlStr = "Select * FROM zalada.orders WHERE receiptid ='" + receiptid+ "'";
			ResultSet rs = stmt.executeQuery(sqlStr);
			
			while(rs.next()) {
				int productid = rs.getInt("productid");
				int qty = rs.getInt("qty");
				String shippingFee = rs.getString("shippingfee");
				String productprice = rs.getString("productprice");
				
				String email = rs.getString("email");
				String phonenumber = rs.getString("phonenumber");
				String firstname = rs.getString("firstname");
				String lastname = rs.getString("lastname");
				String phonenumber2 = rs.getString("phonenumber2");
				String addressln1 = rs.getString("addressln1");
				String addressln2 = rs.getString("addressln2");
				String city = rs.getString("city");
				String country = rs.getString("country");
				String postalcode = rs.getString("postalcode");
				
				
				OrderList a = new OrderList(productid, qty, receiptid, productprice, shippingFee, email, phonenumber, firstname, lastname, phonenumber2, addressln1, addressln2, city, country, postalcode);
				orderList.add(a);
			}
			 
			conn.close();
			
		} catch(Exception e) {
			System.out.println("Error: " + e);
		}
		
		return orderList;
	}
	
	public static ArrayList<ProductOrder> getProductDB(int productid) {
		ArrayList<ProductOrder> productDB = new ArrayList<ProductOrder>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew, "root", "root");
			Statement stmt = conn.createStatement();
			String sqlStr = "Select * FROM zalada.products WHERE productid ='" + productid+ "'";
			ResultSet rs = stmt.executeQuery(sqlStr);
			
			while(rs.next()) {
			 String name = rs.getString("name");
			 String briefdesc = rs.getString("briefdesc");
			 String detaildesc = rs.getString("detaildesc");
			 int categoryid = rs.getInt("categoryid");
			 String image = rs.getString("image");
			 
			 ProductOrder a = new ProductOrder(productid, name, briefdesc, detaildesc, categoryid, image);
			 productDB.add(a);
			}
			conn.close();
			
		} catch(Exception e) {
			System.out.println("Error: " + e);
		}
		
		
		return productDB;
	}
	
	
}