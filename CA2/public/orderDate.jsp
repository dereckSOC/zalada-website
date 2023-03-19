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
<body>
<%@ include file = "header.jsp" %>
<%
	String month = (String)request.getParameter("month");
	ArrayList<OrderDate> productList = CrudFunction.orderDate(month);
%>
	<h1 style ="text-align: center;">All Orders <%=month.substring(0, month.length() - 1) %></h1>



<% 
int orderid;
String username;
String CreatedTime;
String totalprice;
String firstname;
String lastname;
String receipt;
int productid;
	
		
%>
<table class="center" style="margin-bottom: 3em;">
		<tr>
			<th>orderid</th>
			<th>productid</th>
			<th>Username</th>
			<th>Customer Name</th>
			<th>Price</th>
			<th>Receipt ID</th>
			<th>Created Time</th>

		</tr>
<% 
for (OrderDate c: productList) {
		orderid = c.getOrderid();
		productid = c.getProductid();
		totalprice = c.getProductprice();
		CreatedTime =c.getCreateTime();
		username = c.getUsername();
		firstname = c.getFirstname();
		lastname = c.getLastname();
		receipt = c.getReceipt();


%>
	<tr>
		
		<td><%=orderid %></td>
		<td><%=productid %></td>
		<td><%=username%></td>
		<td><%=firstname %> <%=lastname %></td>
		<td>$<%=totalprice %></td>
		<td><%=receipt %></td>
		<td><%=CreatedTime %></td>
	</tr>
<% 
	
}

%>
</table>
<div class="back2Profile" style ="text-align: center; margin-bottom: 40px;">
	<a href="accountPage.jsp"><button>Back to profile</button></a>
</div>

</body>

</html>