package dbaccess;
import java.sql.*;
import java.util.*;

import Product.*;

public class CrudFunction {
	
	//Gets ALL products
	public static ArrayList<Products> getAllProducts() {
		//Create new ArrayList
		ArrayList<Products> allProducts= new ArrayList<Products>();
		
		int productid,stock,categoryID;
		String name,briefDesc,detailDesc,retailPrice,costPrice,image;
		Products c;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew);
			Statement stmt = conn.createStatement();
			String sqlStr = "Select * FROM zalada.products";
			ResultSet rs = stmt.executeQuery(sqlStr);
			
			while(rs.next()) {
				productid = rs.getInt("productid");
				name = rs.getString("name");
				briefDesc = rs.getString("briefdesc");
				detailDesc = rs.getString("detaildesc");
				retailPrice = rs.getString("retailprice");
				costPrice = rs.getString("costprice");
				stock = rs.getInt("stock");
				categoryID = rs.getInt("categoryid");
				image = rs.getString("image");
				
				
				c = new Products(productid,name,briefDesc,detailDesc,costPrice,retailPrice,stock,categoryID,image);
				allProducts.add(c);
			}
			conn.close();
			
			
		} catch(Exception e) {
			System.out.println("Error: " + e);
		}
		
		
		return allProducts;
	}
	
	//Get a product
	public static Products getProduct(int productid) {
		
		int stock,categoryID;
		String name,briefDesc,detailDesc,retailPrice,costPrice,image;
		Products c=null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew);
			Statement stmt = conn.createStatement();
			String sqlStr = "Select * FROM zalada.products WHERE productid='" + productid + "'";
			ResultSet rs = stmt.executeQuery(sqlStr);
			
			while(rs.next()) {
				productid = rs.getInt("productid");
				name = rs.getString("name");
				briefDesc = rs.getString("briefdesc");
				detailDesc = rs.getString("detaildesc");
				retailPrice = rs.getString("retailprice");
				costPrice = rs.getString("costprice");
				stock = rs.getInt("stock");
				categoryID = rs.getInt("categoryid");
				image = rs.getString("image");
				c = new Products(productid,name,briefDesc,detailDesc,costPrice,retailPrice,stock,categoryID,image);
			}
			conn.close();
			
			
		} catch(Exception e) {
			System.out.println("Error: " + e);
		}
		return c;
	}
	
	//Get a product by Category
	public static ArrayList<Products> getProductCat(int categoryid) {
		ArrayList<Products> allProducts= new ArrayList<Products>();
		
		int productid,stock,categoryID;
		String name,briefDesc,detailDesc,retailPrice,costPrice,image;
		Products c=null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew);
			Statement stmt = conn.createStatement();
			String sqlStr = "Select products.*, categories.category FROM products INNER JOIN categories ON products.categoryid = categories.categoryid WHERE products.categoryid='"+ categoryid + "'";
			ResultSet rs = stmt.executeQuery(sqlStr);
			
			while(rs.next()) {
				productid = rs.getInt("productid");
				name = rs.getString("name");
				briefDesc = rs.getString("briefdesc");
				detailDesc = rs.getString("detaildesc");
				retailPrice = rs.getString("retailprice");
				costPrice = rs.getString("costprice");
				stock = rs.getInt("stock");
				categoryID = rs.getInt("categoryid");
				image = rs.getString("image");
				c = new Products(productid,name,briefDesc,detailDesc,costPrice,retailPrice,stock,categoryID,image);
				allProducts.add(c);
			}
			conn.close();
			
			
		} catch(Exception e) {
			System.out.println("Error: " + e);
		}
		return allProducts;
	}
	
	//Get Category Name
	public static String getCategory(int categoryid) {
		String cat="";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew);
			Statement stmt = conn.createStatement();
			String sqlStr = "Select category FROM zalada.categories WHERE categoryid='" + categoryid + "'";
			ResultSet rs = stmt.executeQuery(sqlStr);
			
			while(rs.next()) {
				cat = rs.getString("category");
			}
			conn.close();
			
			
		} catch(Exception e) {
			System.out.println("Error: " + e);
		}
		return cat;
	}
	
	
	//Get All Users
	public static ArrayList<UserDetailList> getAllUsers() {
		//Create new ArrayList
		ArrayList<UserDetailList> allUsers= new ArrayList<UserDetailList>();
		String  username="", password="", email="", phonenumber="", role="";
		int userid=0;
		UserDetailList c;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew);
			Statement stmt = conn.createStatement();
			String sqlStr = "Select * FROM zalada.users";
			ResultSet rs = stmt.executeQuery(sqlStr);
			
			while(rs.next()) {
				userid = rs.getInt("userid");
				username = rs.getString("username");
				password = rs.getString("password");
				email = rs.getString("email");
				phonenumber = rs.getString("phonenumber");
				role = rs.getString("role");
				
				c = new UserDetailList(userid, username,password,email,phonenumber,role);
				allUsers.add(c);
			}
			conn.close();
			
			
		} catch(Exception e) {
			System.out.println("Error: " + e);
		}
		
		
		return allUsers;
	}
	
	//Get Single User
	public static UserDetailList getUser(int userid) {
		String  username="", password="", email="", phonenumber="", role="";
		UserDetailList c = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew);
			Statement stmt = conn.createStatement();
			String sqlStr = "Select * FROM zalada.users WHERE userid='" + userid + "'";
			ResultSet rs = stmt.executeQuery(sqlStr);
			
			while(rs.next()) {
				username = rs.getString("username");
				password = rs.getString("password");
				email = rs.getString("email");
				phonenumber = rs.getString("phonenumber");
				role = rs.getString("role");
				
				c = new UserDetailList(userid, username,password,email,phonenumber,role);
			}
			conn.close();
			
			
		} catch(Exception e) {
			System.out.println("Error: " + e);
		}
		
		
		return c;
	}
	
	public static int checkOrder(int userid) {
		int checker = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew);
			Statement stmt=conn.createStatement();
			String sqlStr = "SELECT * from zalada.orders WHERE userid='" + userid + "'";
			ResultSet rs = stmt.executeQuery(sqlStr);
			if (rs.next()) {
				checker = 1;
			}
			conn.close();
		}catch (Exception e) {
			System.out.println("Error: " + e);
		}
		return checker;
	}
	
	public static int deleteOrder(int userid) {
		int i = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew);
			Statement stmt=conn.createStatement();
			String sqlStr = "DELETE from zalada.orders WHERE userid='" + userid + "'";
			i = stmt.executeUpdate(sqlStr);
			conn.close();
		}catch (Exception e) {
			System.out.println("Error: " + e);
		}
		return i;
	}	
	
	public static int checkAddress(int userid) {
		int checker = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew);
			Statement stmt=conn.createStatement();
			String sqlStr = "SELECT * from zalada.shippingaddress WHERE userid='" + userid + "'";
			ResultSet rs = stmt.executeQuery(sqlStr);
			if (rs.next()) {
				checker = 1;
			}
		}catch (Exception e) {
			System.out.println("Error: " + e);
		}
		return checker;
	}
	
	public static int deleteAddress(int userid) {
		int i = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew);
			Statement stmt=conn.createStatement();
			String sqlStr = "DELETE from zalada.shippingaddress WHERE userid='" + userid + "'";
			i = stmt.executeUpdate(sqlStr);
			conn.close();
		}catch (Exception e) {
			System.out.println("Error: " + e);
		}
		return i;
	}
	
	public static int deleteUser(int userid) {
		int i = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew);
			Statement stmt=conn.createStatement();
			String sqlStr = "DELETE from zalada.users WHERE userid='" + userid + "'";
			i = stmt.executeUpdate(sqlStr);
			conn.close();
		}catch (Exception e) {
			System.out.println("Error: " + e);
		}
		return i;
	}
	
	public static int deleteProduct(int productid) {
		int i = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew);
			Statement stmt=conn.createStatement();
			String sqlStr = "DELETE from zalada.products WHERE productid='" + productid + "'";
			i = stmt.executeUpdate(sqlStr);
			conn.close();
		}catch (Exception e) {
			System.out.println("Error: " + e);
		}
		return i;
	}
	
	public static int checkProductOrder(int productid) {
		int checker = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew);
			Statement stmt=conn.createStatement();
			String sqlStr = "SELECT * from zalada.orders WHERE productid='" + productid + "'";
			ResultSet rs = stmt.executeQuery(sqlStr);
			if (rs.next()) {
				checker = 1;
			}
			conn.close();
		}catch (Exception e) {
			System.out.println("Error: " + e);
		}
		return checker;
	}
	
	public static int deleteOrderByProductID(int productid) {
		int i = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew);
			Statement stmt=conn.createStatement();
			String sqlStr = "DELETE from zalada.orders WHERE productid='" + productid + "'";
			i = stmt.executeUpdate(sqlStr);
			conn.close();
		}catch (Exception e) {
			System.out.println("Error: " + e);
		}
		return i;
	}
	
	public static ArrayList<ProductNew> topProduct() {
		ArrayList<ProductNew> allProducts = new ArrayList<ProductNew>();
		int productid,sold;
		String name,briefDesc,retailPrice,image;
		ProductNew c;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew, "root", "root");
			Statement stmt = conn.createStatement();
			String sqlStr = "Select * FROM products ORDER BY sold DESC LIMIT 0, 5";
			ResultSet rs = stmt.executeQuery(sqlStr);

			while(rs.next()){
				productid = rs.getInt("productid");
				name = rs.getString("name");
				briefDesc = rs.getString("briefdesc");
				retailPrice = rs.getString("retailprice");
				image = rs.getString("image");
				sold = rs.getInt("sold");
				
				c = new ProductNew(productid, name, briefDesc, retailPrice, image, sold);
				allProducts.add(c);
			}
			
			conn.close();
		}
		catch(Exception e) {
			System.out.println("Error: " + e);
		}
		return allProducts;
	}
	
	public static ArrayList<ProductNew> bottomProduct() {
		ArrayList<ProductNew> allProducts = new ArrayList<ProductNew>();
		int productid,sold;
		String name,briefDesc,retailPrice,image;
		ProductNew c;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew, "root", "root");
			Statement stmt = conn.createStatement();
			String sqlStr = "Select * FROM products ORDER BY sold ASC LIMIT 0, 5";
			ResultSet rs = stmt.executeQuery(sqlStr);

			while(rs.next()){
				productid = rs.getInt("productid");
				name = rs.getString("name");
				briefDesc = rs.getString("briefdesc");
				retailPrice = rs.getString("retailprice");
				image = rs.getString("image");
				sold = rs.getInt("sold");
				
				c = new ProductNew(productid, name, briefDesc, retailPrice, image, sold);
				allProducts.add(c);
			}
			
			conn.close();
		}
		catch(Exception e) {
			System.out.println("Error: " + e);
		}
		return allProducts;
	}
	
	public static ArrayList<checkPurchases> checkPurchases(int productid) {
		ArrayList<checkPurchases> address = new ArrayList<checkPurchases>();
		checkPurchases c;
		int userid=0;
		String username="";
		int qty=0;
		String firstname="";
		String lastname="";
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew, "root", "root");
			Statement stmt = conn.createStatement();
			String sqlStr = "Select users.*, orders.*, sum(orders.qty), users.userid FROM users INNER JOIN orders ON orders.userid = users.userid WHERE orders.productid='"+ productid + "' GROUP BY users.userid ORDER BY sum(orders.qty)";
			ResultSet rs = stmt.executeQuery(sqlStr);
			
			while(rs.next()){
				userid = rs.getInt("userid");
				username = rs.getString("username");
				qty = rs.getInt("sum(orders.qty)");
				firstname = rs.getString("firstname");
				lastname = rs.getString("lastname");
				c = new checkPurchases(userid,username,qty,firstname,lastname);
				address.add(c);
			}
			
			
			
			conn.close();
		} catch (Exception e) {
			System.out.println("Error: " + e);
		}
		
		return address;
	}
	
	public static ArrayList<customerAddress> customerAddress() {
		ArrayList<customerAddress> address = new ArrayList<customerAddress>();
		customerAddress c=null;
		int userid=0;
		String username="";
		String address1="";
		String address2="";
		String postalcode="";
		String firstname="";
		String lastname="";
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew, "root", "root");
			Statement stmt = conn.createStatement();
			String sqlStr = "Select users.*, shippingaddress.* FROM users INNER JOIN shippingaddress ON users.userid = shippingaddress.userid ORDER BY addressLn1 ASC";
			ResultSet rs = stmt.executeQuery(sqlStr);
			
			while(rs.next()){
				userid = rs.getInt("userid");
				username = rs.getString("username");
				postalcode = rs.getString("postalcode");
				firstname = rs.getString("firstname");
				lastname = rs.getString("lastname");
				address1 = rs.getString("addressLn1");
				address2 = rs.getString("addressLn2");
				c = new customerAddress(userid,username,postalcode,firstname,lastname,address1,address2);
				address.add(c);
			}
			
			
			
			conn.close();
		} catch (Exception e) {
			System.out.println("Error: " + e);
		}
		
		return address;
	}
	
	public static ArrayList<LowStock> lowStock() {
		ArrayList<LowStock> allProducts = new ArrayList<LowStock>();
		int productid,stock;
		String name,briefdesc,retailprice,image;
		LowStock c;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew, "root", "root");
			Statement stmt = conn.createStatement();
			String sqlStr = "Select * FROM products WHERE stock < 10 ORDER BY stock ASC";
			ResultSet rs = stmt.executeQuery(sqlStr);

			while(rs.next()){
				productid = rs.getInt("productid");
				name = rs.getString("name");
				briefdesc = rs.getString("briefdesc");
				stock = rs.getInt("stock");
				image = rs.getString("image");
				retailprice = rs.getString("retailprice");
				
				c = new LowStock(productid, name, briefdesc, stock, image,retailprice);
				allProducts.add(c);
			}
			
			conn.close();
		}
		catch(Exception e) {
			System.out.println("Error: " + e);
		}
		return allProducts;
	}
	
	//order date
	public static ArrayList<OrderDate> orderDate(String month) {
		ArrayList<OrderDate> allProducts = new ArrayList<OrderDate>();
		int orderid;
		String username;
		String CreatedTime;
		String totalprice;
		String firstname;
		String lastname;
		String receipt;
		int productid;
		OrderDate c;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew, "root", "root");
			Statement stmt = conn.createStatement();
			String sqlStr = "Select users.*, orders.* FROM users INNER JOIN orders ON users.userid = orders.userid WHERE CreatedTime like '" +month+ "' ORDER BY CreatedTime DESC";
			ResultSet rs = stmt.executeQuery(sqlStr);

			while(rs.next()){
				orderid = rs.getInt("orderid");
				productid = rs.getInt("productid");
				totalprice = rs.getString("productprice");
				CreatedTime = rs.getString("CreatedTime");
				username = rs.getString("username");
				firstname = rs.getString("firstname");
				lastname = rs.getString("lastname");
				receipt = rs.getString("receiptid");
				
				c = new OrderDate(orderid,productid,totalprice,CreatedTime,username,firstname,lastname,receipt);
				allProducts.add(c);
			}
			
			conn.close();
		}
		catch(Exception e) {
			System.out.println("Error: " + e);
		}
		return allProducts;
	}
	
	//customerPurchase
	public static ArrayList<TopPurchase> customerPurchaseValue() {
		ArrayList<TopPurchase> allProducts = new ArrayList<TopPurchase>();
		int userid;
		String username;
		String firstname;
		String lastname;
		Double sum;
		TopPurchase c;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String connURLNew = "jdbc:mysql://localhost/zalada?serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew, "root", "root");
			Statement stmt = conn.createStatement();
			String sqlStr = "Select users.*, orders.*, sum(orders.productprice) FROM users INNER JOIN orders ON users.userid = orders.userid GROUP BY users.userid ORDER BY sum(orders.productprice) DESC LIMIT 0,10";
			ResultSet rs = stmt.executeQuery(sqlStr);

			while(rs.next()){
				userid = rs.getInt("userid");
				username = rs.getString("username");
				firstname = rs.getString("firstname");
				lastname = rs.getString("lastname");
				sum = rs.getDouble("sum(orders.productprice)");
				
				c = new TopPurchase(userid,username,firstname,lastname,sum);
				allProducts.add(c);
			}
			
			conn.close();
		}
		catch(Exception e) {
			System.out.println("Error: " + e);
		}
		return allProducts;
	}
}
