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

	.center{
		margin-left:auto;
		margin-right:auto;
	}
	th{
		background-color: orange;
		color: white;
	}
	th, td {
	  padding: 15px;
	  text-align: left;
	  border: 1px solid black;
	  
	  
	}
	
	body {
		font-family: 'Roboto', sans-serif;
	}
</style>
<body>
<%@ include file = "header.jsp" %>
	<h1 style ="text-align: center;">Top 10 Customers by Purchase Value</h1>



<% 
if(session.getAttribute("username") == null || session.getAttribute("username").equals("")){
	response.sendRedirect("index.jsp");
}

int userid;
String username;
String firstname;
String lastname;
Double sum;
int rank = 1;

ArrayList<TopPurchase> productList = CrudFunction.customerPurchaseValue();
%>
<table class="center" style="margin-bottom: 3em;">
		<tr>
			<th>Rank</th>
			<th>Userid</th>
			<th>Username</th>
			<th>Customer Name</th>
			<th>Total Purchase Value</th>
		</tr>
<% 

	for (TopPurchase c: productList) {
		
		userid = c.getUserid();
		username = c.getUsername();
		firstname = c.getFirstname();
		lastname = c.getLastname();
		sum = c.getSum();
%>
	<tr>
		<td><%=rank %></td>
		<td><%=userid %></td>
		<td><%=username%></td>
		<td><%=firstname %> <%=lastname %></td>
		<td>$<%=String.format("%.2f", sum) %></td>
	</tr>
<% 
		rank++;
	}

%>
</table>
<div class="back2Profile"  style ="text-align: center;">
<a href="accountPage.jsp"><button>Back to profile</button></a>
</div>
</body>

</html>