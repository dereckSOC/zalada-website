<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="Product.*" %>
<%@ page import="dbaccess.*" %>
<%@page import= "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="http://localhost:8080/ST0510-JAD_Practical/assignment/css/styles.css"type="text/css"/>
<meta charset="ISO-8859-1">

<title>Zalada Online</title>
</head>
<body>
<%@page import ="dbaccess.*"%>
<%@page import ="java.sql.*" %>

<%
/*
==========================================
J2EE Application Development Assignment 2
Name: Dereck Rupert Belda Zorca (1837689)
Name: Chng Yi Xuan (1935839)
DIT/FT/2A/01
==========================================
*/


int productid;
String name;
String briefdesc;
String retailprice;
String image;
ArrayList<Products> productList = CrudFunction.getAllProducts();
%>
<%
	
	UserDetails user = (UserDetails)request.getAttribute("userdata");
	
	if (user!=null) {
		session.setAttribute("userid", user.getUserid());
		session.setAttribute("username", user.getUsername());
		session.setAttribute("email", user.getEmail());
		session.setAttribute("hp", user.getPhoneNumber());
		session.setAttribute("role", user.getRole());
		user = null;
		response.sendRedirect("CA2/public/index.jsp");
	}
%>
<%@ include file = "header.jsp" %>
<div id="card-wrapper">
		<div class="row-banner">
			<img src="images/banner1.jpg" alt="banner">
		</div>
					<div class="row-head">
				<a>Featured Products</a>
			</div>
<% 

	for (Products c : productList) {
		
		productid = c.getProductid();
		name = c.getName();
		briefdesc = c.getBriefDesc();
		image = c.getImage();
		retailprice = c.getRetailPrice();
%>

	<div class="card" style="cursor:pointer" onclick="window.location='productDetail.jsp?productid=<%=productid %>';" >
			<img src="<%= image%>" alt="noimage.jpg" style= "width:200px; height:200px"/>
		<div class ="container">
			<h4 class="featured-name"><%=name %></h4>
			<p style="color: rgb(247, 147, 30);">$<%= retailprice %></p>
		</div>
	</div>
<% 
}

%>
</div>
<br><br>
<%@ include file = "footer.jsp" %>
</body>
</html>
