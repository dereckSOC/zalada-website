package dbaccess;
import java.sql.*;

public class RegisterBean {
	public String registerUser(String username, String email, String hp, String password) throws SQLException {
		Connection conn = null;
		String status = null;
		String role = "user";
		
		try {
		    Class.forName("com.mysql.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
			conn = DriverManager.getConnection(connURL);
			String sqlStr = "INSERT into zalada.users(username,password,email,phonenumber,role)values(?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setString(3, email);
			pstmt.setString(4, hp);
			pstmt.setString(5, role);

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
