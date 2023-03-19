package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbaccess.*;

/**
 * Servlet implementation class postProductServlet
 */
@WebServlet("/postProductServlet")
public class postProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String briefdesc = request.getParameter("briefdesc");
		String detaildesc = request.getParameter("detaildesc");
		String costprice = request.getParameter("costprice");
		String retailprice = request.getParameter("retailprice");
		String stock = request.getParameter("stock");
		String category = request.getParameter("category");
		String image = request.getParameter("image");

			try {
				postProduct post = new postProduct();
				String status = post.addProduct(name, briefdesc, detaildesc, costprice, retailprice, stock, category, image);
				if(status.equals("success")) {
					String valid;
					valid = "prodAdd";
					request.setAttribute("msg", valid);
		            RequestDispatcher rd = request.getRequestDispatcher("CA2/public/accountPage.jsp");	
		            rd.forward(request, response);
		        }
				else if(status.equals("failure")) {
					String invalid;
					invalid = "prodInvalid";
					request.setAttribute("msg", invalid);
		            RequestDispatcher rd = request.getRequestDispatcher("CA2/public/accountPage.jsp");	
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
