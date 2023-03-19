package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Product;

/**
 * Servlet implementation class deleteItemCart
 */
@WebServlet("/deleteItemCart")
public class deleteItemCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteItemCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		try {
			HttpSession session = request.getSession();
			String counterStr = request.getParameter("deleteID");
			int counter = Integer.parseInt(counterStr);

			ArrayList<Product> shoppingCart = (ArrayList<Product>)session.getAttribute("shoppingCart");
			
			shoppingCart.remove(counter);
			
			if (shoppingCart.isEmpty()) {
				session.setAttribute("shoppingCart", null);
			} else {
			session.setAttribute("shoppingCart", shoppingCart);
			}
			
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
