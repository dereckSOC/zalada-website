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
<link rel="stylesheet" href="css/styles.css"type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Roboto:wght@700&display=swap" rel="stylesheet">
<title>Zalada Online</title>
</head>
<!-- 
==========================================
J2EE Application Development Assignment 2
Name: Dereck Rupert Belda Zorca (1837689)
Name: Chng Yi Xuan (1935839)
DIT/FT/2A/01
==========================================
 -->
<style>
	body {
		font-family: 'Roboto', sans-serif;
	}
	
	.container-footer {
	position: fixed;
	bottom: 0;
	}
	
</style>
<body>
<%@ include file = "header.jsp" %>
	<h1 style ="text-align: center;">Low Stock (Less than 10)</h1>

<div id="card-wrapper">


<% 
if(session.getAttribute("username") == null || session.getAttribute("username").equals("")){
	response.sendRedirect("index.jsp");
}
int productid;
String name;
String briefdesc;
String retailprice;
int stock;
String image;
int rank = 1;

ArrayList<LowStock> productList = CrudFunction.lowStock();
	
	for (LowStock c: productList) {
		
		productid =c.getProductid();
		name = c.getName();
		briefdesc = c.getBriefdesc();
		stock = c.getStock();
		image = c.getImage();
		retailprice = c.getRetailprice();
%>
	<div class="card" >
			<img src="<%= image%>" alt="noimage.jpg" style= "width:200px; height:200px"/>
		<div class ="container">
			<h4 class="featured-name"><%=name %></h4>
			<p style="color: rgb(247, 147, 30);">$<%= retailprice %></p>
			<p style="color: rgb(170, 1, 30);">Stock: <%=stock %></p>
		</div>
	</div>
<% 
	rank++;
	}
	
%>
</div>
<div class="back2Profile"  style ="text-align: center;">
<a href="accountPage.jsp"><button>Back to profile</button></a>
</div>
<%@ include file = "footer.jsp" %>
</body>

</html>