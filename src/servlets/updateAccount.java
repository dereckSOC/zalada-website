package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import dbaccess.UserDetails;
import dbaccess.LoginBean;
/**
 * Servlet implementation class updateAccount
 */
@WebServlet("/updateAccount")
public class updateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		int	useridInt = (Integer) session.getAttribute("userid");

		String email1 = (String)session.getAttribute("email");
		String hp1 = (String)session.getAttribute("hp");
		
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("hp");
		String pwd = request.getParameter("pwd");
		String pwd2 = request.getParameter("pwd2");
		String sqlStr;
		
		if (email == "") {
			email = email1;
		}
		if (phonenumber == "") {
			phonenumber = hp1;
		}
		
		
		if (pwd.equals(pwd2) || pwd.equals("") && pwd.equals("")) {
			if (email.equals(email1) && phonenumber.equals(hp1)) {
				response.sendRedirect("CA2/public/accountPage.jsp?code=err1");
			}
			else {
				try {
					String connURL="jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
					Connection conn = DriverManager.getConnection(connURL);
					Statement stmt = conn.createStatement();
					if (pwd.equals("") && pwd.equals("")) {
						sqlStr = "UPDATE zalada.users SET email='" + email + "', phonenumber='" + phonenumber + "' WHERE userid='" + useridInt + "'";
					} else {
						sqlStr = "UPDATE zalada.users SET email='" + email + "', phonenumber='" + phonenumber + "', password='" + pwd + "' WHERE userid='" + useridInt + "'";
					}
					int count = stmt.executeUpdate(sqlStr);
					
					if (count > 0) {
						System.out.println(count);
					}
					conn.close();
					
					session.setAttribute("email", email);
					session.setAttribute("hp", phonenumber);
					
					response.sendRedirect("CA2/public/accountPage.jsp?code=success");
				} 
				catch (Exception e) {
					System.err.println("Error :" + e);
				}
			}
			
		}
		else {
			response.sendRedirect("CA2/public/accountPage.jsp?code=err");
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
