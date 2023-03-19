package servlets;

import java.io.IOException;
import javax.ws.rs.client.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.*;

/**
 * Servlet implementation class currencyConversionServlet
 */
@WebServlet("/currencyConversionServlet")
public class currencyConversionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public currencyConversionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Client client = ClientBuilder.newClient();
		WebTarget target = client.target("https://api.exchangeratesapi.io")
				.path("latest")
				.queryParam("base","SGD");
		Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);
		Response res = invocationBuilder.get();
		System.out.print("status: " + res.getStatus());
		
		if(response.getStatus() == Response.Status.OK.getStatusCode()) {
			String currency = request.getParameter("currency");
			System.out.println("success");
			String result = res.readEntity(new GenericType<String>() {});
			request.setAttribute("currency", currency);
			request.setAttribute("rates", result);
			RequestDispatcher rd = request.getRequestDispatcher("CA2/public/checkoutcurrency.jsp");
			rd.forward(request, response);
		}else {
			System.out.println("failed");
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
