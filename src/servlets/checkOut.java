package servlets;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Product;

/**
 * Servlet implementation class checkOut
 */
@WebServlet("/checkOut")
public class checkOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkOut() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int userid;
		HttpSession session = request.getSession();
		if (session.getAttribute("userid") == null) {
			//guest
			userid = 0;
		}
		else {
			userid = (Integer) session.getAttribute("userid");
		}	
		int useridInt = userid;
		String receiptid = UUID.randomUUID().toString();
		String shippingFee = (String) session.getAttribute("shippingFee");
		String checkoutPrice = (String) session.getAttribute("checkoutPrice");
		
		
		
		try {
			//get address
			String addressLn2="";
			//[contact info]
			String email = request.getParameter("email");
			String phoneNumber = request.getParameter("hp");
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
			
			//update stock & create order row
			ArrayList<Product> shoppingCart = (ArrayList<Product>)session.getAttribute("shoppingCart");
			for (Product item: shoppingCart) {
				int id = item.getProductid();
				int qty = item.getQty();
				double retailpriceGst = (item.getRetailPrice() * qty) * 1.07;
				String productprice = String.format("%.2f", retailpriceGst);
				
				//updates stock
				try {
					String connURL="jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
					Connection conn = DriverManager.getConnection(connURL);
					Statement stmt = conn.createStatement();
					String sqlStr = "UPDATE zalada.products SET stock = stock - '" + qty + "', sold = sold + '" + qty +"' WHERE productid='" + id + "'";
					int count = stmt.executeUpdate(sqlStr);
					System.out.println(count);
					conn.close();
				} 
				catch (Exception e) {
					System.err.println("Error :" + e);
				}
				
				
				//insert order row
				try {
					String connURL="jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
					Connection conn = DriverManager.getConnection(connURL);
					String sql = "INSERT into zalada.orders(userid,productid,qty,email,phonenumber,firstname,lastname,phonenumber2,addressln1,addressln2,city,country,postalcode,receiptid,shippingfee,productprice) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"; 
					PreparedStatement stmt = conn.prepareStatement(sql);
					stmt.setInt(1,useridInt);
					stmt.setInt(2, id);
					stmt.setInt(3, qty);
					
					stmt.setString(4, email);
					stmt.setString(5, phoneNumber);
					
					stmt.setString(6, firstName);
					stmt.setString(7, lastName);
					stmt.setString(8, phoneNumber2);
					stmt.setString(9, addressLn1);
					stmt.setString(10, addressLn2);
					stmt.setString(11, city);
					stmt.setString(12, country);
					stmt.setString(13, postalCode);
					stmt.setString(14, receiptid);
					stmt.setString(15, shippingFee);
					stmt.setString(16, productprice);
					int count = stmt.executeUpdate();
					System.out.println(count);
					conn.close();
				} 
				catch (Exception e) {
					System.err.println("Error :" + e);
				}
			}
			
			session.removeAttribute("shoppingCart");
			session.removeAttribute("shippingFee");
			session.removeAttribute("checkoutPrice");
			response.sendRedirect("CA2/public/index.jsp");
			
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
