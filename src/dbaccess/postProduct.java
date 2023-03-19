package dbaccess;

import java.sql.*;

public class postProduct {
	public String addProduct(String name, String briefdesc, String detaildesc, String costprice, String retailprice, String stock, String category, String image) throws SQLException {
		Connection conn = null;
		String status = null;
		int sold = 0;
		try {
		    Class.forName("com.mysql.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
			conn = DriverManager.getConnection(connURL);
			String sqlStr = "INSERT into products(name,briefdesc,detaildesc,costprice,retailprice,stock,categoryid,image,sold)values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setString(1, name);
			pstmt.setString(2, briefdesc);
			pstmt.setString(3, detaildesc);
			pstmt.setString(4, costprice);
			pstmt.setString(5, retailprice);
			pstmt.setString(6, stock);
			pstmt.setString(7, category);
			pstmt.setString(8, image);
			pstmt.setInt(9, sold);



			int rowsAffected = pstmt.executeUpdate();
			if(rowsAffected == 1) {
				status = "success";
			}
			else if(rowsAffected == 0) {
				status = "failure";
			}
			
		}catch(Exception e) {
			System.out.print(e);
		}
		conn.close();
		return status;
	}
}
