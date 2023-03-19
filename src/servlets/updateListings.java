package servlets;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updateListings
 */
@WebServlet("/updateListings")
public class updateListings extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateListings() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String productid=request.getParameter("productid");
		String productname=request.getParameter("productname");
		String briefdesc=request.getParameter("briefdesc");
		String detaildesc=request.getParameter("detaildesc");
		String costprice=request.getParameter("costprice");
		String retailprice=request.getParameter("retailprice");
		String stock=request.getParameter("stock");
		String category=request.getParameter("category");
		String image=request.getParameter("image");
		
		try{
			String connURLNew = "jdbc:mysql://localhost/zalada?user=root&password=root&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURLNew);
			Statement stmt = conn.createStatement();
			String sqlStr = "UPDATE products SET name='"+productname+"',briefdesc='"+briefdesc+"',detaildesc='"+detaildesc+"',costprice='"+costprice+"',retailprice='"+retailprice+"',stock='"+stock+"',categoryid='"+category+"',image='"+image+"' WHERE productid="+productid;
			int nRowsAffected = stmt.executeUpdate(sqlStr);
			
			if(nRowsAffected > 0){
				response.sendRedirect("CA2/public/editProductListings.jsp?productid=" + productid +"&errCode=success");
			}
			
			conn.close();
		}catch(Exception e){
			response.sendRedirect("CA2/public/editProductListings.jsp?productid=" + productid +"&errCode=error");
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
