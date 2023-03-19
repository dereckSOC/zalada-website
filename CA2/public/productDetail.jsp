<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="Product.*" %>
<%@ page import="dbaccess.*" %>
<%@page import= "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<%@page import ="java.sql.*" %>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="css/styles.css"type="text/css"/>
<link href="https://fonts.googleapis.com/css2?family=Amiri:ital,wght@1,700&family=Pacifico&family=Roboto:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Libre+Franklin&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@400;700&display=swap" rel="stylesheet">


<title>Zalada Online</title>

</head>
<!-- 
==========================================
J2EE Application Development Assignment 2
Name: Dereck Rupert Belda Zorca (1837689)
Name: Chng Yi Xuan (1935839)
DIT/FT/2A/01
==========================================
 --> -->
 
<style>
	.detail-container {
		font-family: 'Libre Franklin', sans-serif;
	}
	
	.productinfo input[type=submit] {
		border: none;
		color: white;
		padding-left: 20px;
		padding-right: 20px;
		padding-top: 10px;
		padding-bottom: 10px;
		background-color: rgb(247, 147, 30);
		border-radius: 3px;
	}
	
	.productinfo input[type=submit]:hover {
		opacity: 0.7;
	}
	
	.productinfo input[type=number] {
		padding: 12px 5px;
		width: 10%;
  		border: none;
  		background-color: rgb(238,238,238);
  		text-align: center;
  	}
</style>

 
<body>
<%@ include file = "header.jsp" %>

<%
String productidStr=request.getParameter("productid");
int productid = Integer.parseInt(productidStr);

int id=0;
int categoryid;
String name="";
String briefdesc="";
String detaildesc="";
String costprice="";
String retailprice="";
String stockStr="";
int stock;
String image="";

Products a = CrudFunction.getProduct(productid);
id = a.getProductid();
name = a.getName();
briefdesc = a.getBriefDesc();
detaildesc = a.getDetailDesc();
costprice = a.getCostPrice();
retailprice = a.getRetailPrice();
stock = a.getStock();
categoryid = a.getCategoryID();
image = a.getImage();
String category = CrudFunction.getCategory(categoryid);
double dbretailPrice =  Double.valueOf(retailprice); 
%>
	<div class="detail-container" >
		<div class="row"  style="background-color: white; padding-top: 50px; padding-bottom: 50px;" id="shadow">
			<img src="<%=image %>" style="width: 400px; height: 400px; float:left; padding-right:20px;">
			<div class="productinfo" >
				<h1 class="detail-name"><%=name %></h1>
				<p class="briefdesc"><%=briefdesc %></p>
				<a href="productCategory.jsp?productCategory=<%=categoryid %>" >Category:<%=category %></a>
				<p class="detail-description"><br><br><b>Description:</b><br><%=detaildesc %><br></p>
				<p class="detail-price">$<%=retailprice %></p><br>
				
				
				<form action="../../add2Cart">
					<input type="text" name="id" value="<%=productid%>" style="display: none;">
					<a style="padding-right: 10px;"><b>Quantity</b></a>
					<input type="number" name="qty" min="1" max="<%=stock %>" required><br><br>
					
					<input type="hidden" name="id" value="<%=id %>" />
					
					<input type="hidden" name="name" value="<%=name %>" />
					<input type="hidden" name="briefDesc" value="<%=briefdesc %>" />
					<input type="hidden" name="retailprice" value="<%=dbretailPrice %>" />
					<input type="hidden" name="category" value="<%=category %>" />
					<input type="hidden" name="image" value="<%=image %>" />
					 
					
					
					<input type="submit" value="Add to Cart">
				</form>
				<!-- <button class="cart-btn"><b>Add to Cart</b></button> -->
				
			</div>
		</div>
		
	</div>
<br><br><br><br>
<%@ include file = "footer.jsp" %>
</body>
</html>