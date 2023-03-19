package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbaccess.*;
import dbaccess.UserAddress;
import dbaccess.LoginBean;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		UserDetails uBean = null;
		UserAddress saveAddress = null;
		try {
			String username = request.getParameter("loginid");
			String password = request.getParameter("pwd");
			LoginBean udatabase = new LoginBean();
			uBean=udatabase.loginUser(username, password);
			if(uBean.getUsername() == null) {
				String invalid;
				invalid = "invalidlogin";
				request.setAttribute("msg", invalid);
	            RequestDispatcher rd = request.getRequestDispatcher("CA2/public/login.jsp?errCode=invalidLogin");	
	            rd.forward(request, response);
	        }
			else {
				request.setAttribute("userdata", uBean);
				session.setAttribute("user", uBean);
				
				try {
					int userid = uBean.getUserid();
					LoginBean c = new LoginBean();
					saveAddress = c.saveAddress(userid);
					session.setAttribute("address", saveAddress);
				} catch(Exception e) {
					e.printStackTrace();
				}
				
				RequestDispatcher rd = request.getRequestDispatcher("CA2/public/index.jsp");
				rd.forward(request, response);
			}
		}catch(SQLException e) {
			e.printStackTrace();
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
