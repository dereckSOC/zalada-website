package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.*;

/**
 * Servlet implementation class add2Cart
 */
@WebServlet("/add2Cart")
public class add2Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public add2Cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			HttpSession session = request.getSession();
			String idStr = request.getParameter("id");
			int id = Integer.parseInt(idStr);
			
			String qtyStr = request.getParameter("qty");
			int qty = Integer.parseInt(qtyStr);
			
			
			String name = request.getParameter("name");
			String briefDesc = request.getParameter("briefDesc");
			
			String retailPriceStr = request.getParameter("retailprice");
			double retailprice = Double.valueOf(retailPriceStr);
			
			String category = request.getParameter("category");
			String image = request.getParameter("image");
		
			
			ArrayList<Product> shoppingCart = (ArrayList<Product>)session.getAttribute("shoppingCart");
			if (shoppingCart == null) {
				shoppingCart = new ArrayList<Product>();
			}
			//Product item = new Product(id,qty);
			Product item = new Product(id,name,briefDesc,retailprice,category,image,qty);
			shoppingCart.add(item);
			session.setAttribute("shoppingCart", shoppingCart);
			response.sendRedirect("CA2/public/cart.jsp");
			
			
			//RequestDispatcher rd = request.getRequestDispatcher("CA2/public/checkout.jsp");
			//rd.forward(request, response);
			
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
