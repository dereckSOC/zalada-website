package dbaccess;
import java.sql.*;

public class LoginBean {
	
	public UserDetails loginUser(String username, String password) throws SQLException {
		UserDetails uBean= new UserDetails();
		Connection conn = null;
		try {
		    Class.forName("com.mysql.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
			conn = DriverManager.getConnection(connURL);
		    String sqlStr = "SELECT * FROM zalada.users WHERE username=? and password=?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				uBean.setUserid(rs.getInt("userid"));
				uBean.setUsername(rs.getString("username"));
				uBean.setEmail(rs.getString("email"));
				uBean.setPhoneNumber(rs.getString("phonenumber"));
				uBean.setRole(rs.getString("role"));
			}
			
		}catch(Exception e) {
			System.out.print(e);
		}
		conn.close();
		return uBean;
	}
	
	public UserAddress saveAddress(int userid) throws SQLException {
		int id = userid;
		String firstname,lastname,phonenumber,addressLn1,addressLn2,city,country,postalcode;
		UserAddress c = new UserAddress();
		
		try {
		    Class.forName("com.mysql.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURL);
		    String sqlStr = "SELECT * FROM zalada.shippingaddress WHERE userid=?";
		    PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				firstname = rs.getString("firstname");
				lastname = rs.getString("lastname");
				phonenumber = rs.getString("phonenumber");
				addressLn1 = rs.getString("addressLn1");
				addressLn2 = rs.getString("addressLn2");
				city = rs.getString("city");
				country = rs.getString("country");
				postalcode = rs.getString("postalcode");
				
				c.setFirstname(firstname);
				c.setLastname(lastname);
				c.setAddressLn1(addressLn1);
				c.setAddressLn2(addressLn2);
				c.setPhonenumber(phonenumber);
				c.setCity(city);
				c.setCountry(country);
				c.setPostalcode(postalcode);
				
			}
			
		}catch(Exception e) {
			System.out.print(e);
		}
		return c;
	}
}
