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
<!-- 
==========================================
J2EE Application Development Assignment 2
Name: Dereck Rupert Belda Zorca (1837689)
Name: Chng Yi Xuan (1935839)
DIT/FT/2A/01
==========================================
 -->
</head>
<style>
	.center{
		margin-left:auto;
		margin-right:auto;
	}
	th{
		background-color: orange;
	}
	th, td {
	  padding: 15px;
	  text-align: left;
	  border: 1px solid black
	  
	}
	body {
		font-family: 'Roboto', sans-serif;
	}
	
	.container-footer {
	position: fixed;
	bottom: 0;
	}
</style>
<%
if(session.getAttribute("username") == null || session.getAttribute("username").equals("")){
	response.sendRedirect("index.jsp");
}
	String productidStr = request.getParameter("productid");
	String productname = request.getParameter("name");
	int productid = Integer.parseInt(productidStr);
%>
<body>
<%@ include file = "header.jsp" %>
	<h1 style ="text-align: center;">Customers Who Have Bought: <%=productname %></h1>



<% 


int userid;
String username;
int qty;
String firstname;
String lastname;
ArrayList<checkPurchases> addressList = CrudFunction.checkPurchases(productid);
%>

<table class="center" style="margin-bottom: 3em;">
		<tr>
			<th>Userid</th>
			<th>Username</th>
			<th>Customer Name</th>
			<th>Quantity</th>

		</tr>
<% 

	for (checkPurchases c: addressList) {
		userid = c.getUserid();
		username = c.getUsername();
		qty = c.getQty();
		firstname = c.getFirstname();
		lastname = c.getLastname();
	



%>
	<tr>
		<td><%=userid %></td>
		<td><%=username%></td>
		<td><%=firstname %> <%=lastname %></td>
		<td><%=qty %></td>

	</tr>
<%
	}
%>
</table>
<div class="back2Profile" style ="text-align: center;">
	<a href="accountPage.jsp"><button>Back to profile</button></a>
</div>
</body>

</html>