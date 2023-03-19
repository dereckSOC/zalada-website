package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class adminUpdateAccount
 */
@WebServlet("/adminUpdateAccount")
public class adminUpdateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminUpdateAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String userid=request.getParameter("userid");
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		String email = request.getParameter("email");
		String hp = request.getParameter("hp");
		String role = request.getParameter("role");
		try{
			String connURLNew = "jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew);
			Statement stmt = conn.createStatement();
			String sqlStr = "UPDATE zalada.users SET username='" + name + "',password='" + pwd + "',email='" + email + "', phonenumber='" + hp + "', role='" + role + "' WHERE userid='" + userid + "'";
			int nRowsAffected = stmt.executeUpdate(sqlStr);
			conn.close();
			
			if(nRowsAffected > 0){
				response.sendRedirect("CA2/public/adminEditUser.jsp?userid=" + userid +"&errCode=success");
			}
			
			
		}catch(Exception e){
			response.sendRedirect("CA2/public/adminEditUser.jsp?userid=" + userid +"&errCode=error");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
