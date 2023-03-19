<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="java.sql.*" %>
    <%@ page import="Product.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Zalada Online</title>
</head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="css/styles.css"type="text/css"/>
<link href="https://fonts.googleapis.com/css2?family=Amiri:ital,wght@1,700&family=Pacifico&family=Roboto:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Libre+Franklin&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@400;700&display=swap" rel="stylesheet">
<style>

</style>

<!-- 
==========================================
J2EE Application Development Assignment 2
Name: Dereck Rupert Belda Zorca (1837689)
Name: Chng Yi Xuan (1935839)
DIT/FT/2A/01
==========================================
 -->

<style>
	.shoppingCart {
		display: flex;
		justify-content: center;
		flex-direction: column;
	}
	.main-section {
		min-height: calc(100vh - 127px - 242px);
	}

	.shoppingCart-header {
		text-align: center;
		color: white;
		background-color: rgb(247, 147, 30);
		padding-left: 300px;
		padding-right: 300px;
		padding-top: 15px;
		padding-bottom: 15px;
	}
	
	.shoppingCart-header a {
		font-size: 15px;
		font-family: 'Libre Franklin', sans-serif;
	}
	
	.shoppingCart-row {
		display: flex;
		justify-content: center;
		flex-direction: column;
		width: 100%;
		background-color: white;
	}
	
	.item-row input[type=number] {
		padding: 12px 10px;
		width: 20%;
  		border: none;
  		background-color: rgb(238,238,238);
  		text-align: center;
  	}
  	
  	.item-row input[type=submit] {
  		border: none;
  		background-color: rgb(247, 147, 30);
  		color: white;
  		padding-top: 10px;
  		padding-bottom: 10px;
  		padding-left: 15px;
  		padding-right: 15px;
  		border-radius: 3px;
  		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  	}
  	
  	.item-row input[type=submit]:hover {
		opacity: 0.7;
  	}
  	
  	.item-row {
  		font-family: 'Libre Franklin', sans-serif;
  	}
  	
  	#emptySc {
  		font-family: 'Libre Franklin', sans-serif;
  		font-size: 15px;
  		text-align: center;
  		padding-top: 100px;
  		padding-bottom: 100px;
  	}
  	
  	.sc-Summary {
  	background-color: white;
  	display: flex;
  	flex-direction: column;
  	justify-content: flex-end;
  	padding-bottom: 15px;
  	}
  	
  	.tp-summary {
  		margin-left: 10px;
  		margin-right: 10px;
  	}
  	
  	.tp-summary input[type=submit] {
  		border: none;
  		background-color: rgb(247, 147, 30);
  		color: white;
  		padding-top: 10px;
  		padding-bottom: 10px;
  		padding-left: 15px;
  		padding-right: 15px;
  		border-radius: 3px;
  		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  	}
  	
  	.tp-summary input[type=submit]:hover {
		opacity: 0.7;
  	}
  	
  	.tp-summary a {
  		font-size: 15px;
		font-family: 'Libre Franklin', sans-serif;
  	}

</style>

<%
int counter = 0;
ArrayList<Product> shoppingCart = (ArrayList<Product>)session.getAttribute("shoppingCart");

if (shoppingCart == null) {
	%>
		<style>
			.container-footer {
				/* Fix the footer at the bottom */
				position: fixed;
				bottom: 0;
			}
			#hidden {
				display: none;
			}
		</style>
	<%
}


%>

<body>
<%@ include file = "header.jsp" %>
<div class="container" style="display: flex; justify-content: center; margin-top: 50px; margin-bottom: 50px;">

	<div class="main-section">
		<div class="shoppingCart" id="shadow">
			<div class="shoppingCart-header">
				<a><b>Shopping Cart</b></a>
			</div>
			
		
	
		<div class="shoppingCart-row" >
<%

double totalPrice = 0.0;
double gstPrice = 0.0;

if (shoppingCart == null) {
	out.println("<a id='emptySc'><b>Shopping Cart is Empty!</b></a>");
}
//to delete use arraylist (add array number)
else {
	for (Product item: shoppingCart) {
		
		int id = item.getProductid();
		String name = item.getName();
		String briefdesc = item.getBriefDesc();
		String image = item.getImage();
		int qty = item.getQty();
		double retailprice = item.getRetailPrice();
		totalPrice = totalPrice + retailprice * qty;
		
		
		%>
		
		
	<div class="item" style="display: flex; flex-direction: row; width: 100%;">
	<img src="<%= image%>" alt="noimage.jpg" style= "width:200px; height:200px; margin-left: 10px; margin-right: 10px;"/>
	
	<div class ="container" style="width: 100%; display: flex; align-items: center;">

		<div class="item-row-left" style="width: 50%">
		<div class="item-row" style="display: flex;flex-direction: column;">
			<a><b><%=name %></b></a> 
			<a style="font-size: 13px;"><%=briefdesc %></a>
		</div>
		</div>	
		
		<div class="item-row-right" style="display: flex; justify-content: center; align-items: center; width: 50%; padding-right: 20px;">
		
			<div class="item-row" style="justify-content: center; display: flex; align-items: center;" >
				<input type="number" value="<%=qty %>" readonly='readonly'/>
				<div class="price-wrap" style="width: 100%; display: flex; justify-content: center;">
					<a><b>$<%=String.format("%.2f", (retailprice * qty)) %></b></a>
					
				</div>
				
			</div>
			
			<div class="item-row">
				<form action="../../deleteItemCart" method="post">
					<input type="hidden" value='<%=counter %>' name="deleteID">
					<input type="submit" value="Delete">
				</form>								
			</div>	
			
		</div>




	</div>
</div>
		<%
		counter++;
	}
	
	gstPrice = totalPrice * 1.07;

}
	%>
		</div>
		<div class="sc-Summary" id="hidden">
			<div class="tp-summary" >
				<form action="checkout.jsp?currency=SGD" method="post" style="display: flex; justify-content: flex-end; align-items: center;" >
				<div class="sc-Price" style="display: flex; align-items: flex-end; flex-direction: column;">
					<div class="sc-Top">
						<a style="padding-right: 5px;">Total:</a>
						<a style="padding-right: 5px;">$<%=String.format("%.2f", totalPrice) %></a>
					</div>
					<div class="sc-Bottom">
						<a style="padding-right: 5px;"><b>Sub-Total incl. GST:</b></a>
						<a style="padding-right: 5px;"><b>$
							<% 
								String price = String.format("%.2f", gstPrice); 
							  	out.println(price);
							 %></b></a>				
					</div>
				</div>
				<input type="hidden" value="<%=price %>" name="checkOutTotal"/>
				<input type="submit" value="Check Out"/>
				</form>
			</div>
		</div>	
		
		
	</div>
	</div>
</div>


<%@ include file = "footer.jsp" %>
</body>
</html>