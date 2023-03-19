package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Product;
import dbaccess.*;

/**
 * Servlet implementation class updateAddress
 */
@WebServlet("/updateAddress")
public class updateAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateAddress() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		int	useridInt = (Integer) session.getAttribute("userid");
		
		try {
			//get address
			String addressLn2="";
			//[address]
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String phoneNumber2 = request.getParameter("phone");
			String addressLn1 = request.getParameter("addressLn1");
			
			if (request.getParameter("addressLn2") != null) {
				addressLn2 = request.getParameter("addressLn2");
			}
			
			String city = request.getParameter("city");
			String country = request.getParameter("country");
			String postalCode = request.getParameter("postal");
				
				
				//insert order row
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String connURL="jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
				Connection conn = DriverManager.getConnection(connURL);
				Statement stmt = conn.createStatement();
				String updateSQL = "UPDATE firstname='" + firstName  + "', lastname='" + lastName +"', phonenumber='" + phoneNumber2 + "', addressLn1='" + addressLn1 + "', addressLn2='" + addressLn2 + "', city='" + city + "', country='" + country + "', postalcode='" + postalCode + "', userid='" + useridInt + "'";
				String sql = "INSERT into zalada.shippingaddress(firstname,lastname,phonenumber,addressLn1,addressLn2,city,country,postalcode,userid) values('" + firstName + "','" + lastName + "','" + phoneNumber2 + "','" + addressLn1 + "','" + addressLn2 + "','" + city + "','" + country + "','" + postalCode + "','" + useridInt +"')";
				sql = sql + " ON DUPLICATE KEY " + updateSQL;
				System.out.println(sql);
				int count = stmt.executeUpdate(sql);
				System.out.println(count);
				conn.close();
			} 
			catch (Exception e) {
				System.err.println("Error :" + e);
			}
			
			UserAddress a = (UserAddress)session.getAttribute("address");
			a.setFirstname(firstName);
			a.setLastname(lastName);
			a.setAddressLn1(addressLn1);
			a.setAddressLn2(addressLn2);
			a.setPhonenumber(phoneNumber2);
			a.setCity(city);
			a.setCountry(country);
			a.setPostalcode(postalCode);
			session.setAttribute("address", a);

			response.sendRedirect("CA2/public/accountPage.jsp?code=successAddr");
			
		} catch (Exception e) {
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
