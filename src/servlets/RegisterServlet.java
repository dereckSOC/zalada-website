package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbaccess.RegisterBean;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String hp = request.getParameter("hp");
		String pwd = request.getParameter("pwd");
		String pwd2 = request.getParameter("pwd2");
		
		if (username == "" || pwd =="" || pwd2 == "") {
			String invalid;
			invalid = "emptyInput";
			request.setAttribute("msg", invalid);
            RequestDispatcher rd = request.getRequestDispatcher("CA2/public/login.jsp");	
			rd.forward(request, response);
		}
		else if(pwd.equals(pwd2)) {
			try {
				RegisterBean register = new RegisterBean();
				String status = register.registerUser(username, email, hp, pwd);
				if(status.equals("success")) {
					String valid;
					valid = "createdUser";
					request.setAttribute("msg", valid);
		            RequestDispatcher rd = request.getRequestDispatcher("CA2/public/login.jsp");	
		            rd.forward(request, response);
		        }
				else if(status.equals("failure")) {
					String invalid;
					invalid = "usernameExists";
					request.setAttribute("msg", invalid);
		            RequestDispatcher rd = request.getRequestDispatcher("CA2/public/login.jsp");	
					rd.forward(request, response);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	
		else {
			String invalid;
			invalid = "pwdNo";
			request.setAttribute("msg", invalid);
            RequestDispatcher rd = request.getRequestDispatcher("CA2/public/login.jsp");	
			rd.forward(request, response);
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
