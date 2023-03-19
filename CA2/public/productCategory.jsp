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
 -->
 <style>
 	.main {
 	min-height: calc(100vh - 127px - 242px);"
 	}
 </style>
<body>
<%@ include file = "header.jsp" %>

<div class="main" id="card-wrapper">
<%
String productCategory=request.getParameter("productCategory");
int categoryid = Integer.parseInt(productCategory);
ArrayList<Products> allProducts = CrudFunction.getProductCat(categoryid);
int id=0;
String name="";
String briefdesc="";
String detaildesc="";
String costprice="";
String retailprice="";
int stock=0, categoryID=0;
String category = CrudFunction.getCategory(categoryid);
String image="";



%>
<h1 style="font-size: 45px;	font-family: 'Roboto', sans-serif;"><%= category%></h1>
<% 

for (Products c: allProducts){
	id = c.getProductid();
	name = c.getName();
	briefdesc = c.getBriefDesc();
	detaildesc = c.getDetailDesc();
	retailprice = c.getRetailPrice();
	stock = c.getStock();
	image = c.getImage();
	categoryID = c.getCategoryID();
	%>
	<div class="card" style="cursor:pointer" onclick="window.location='productDetail.jsp?productid=<%=id %>';" >
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
<br><br><br><br>
<%@ include file = "footer.jsp" %>
</body>
</html>