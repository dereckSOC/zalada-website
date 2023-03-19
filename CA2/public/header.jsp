<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="css/styles.css"type="text/css"/>
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
<%
	if (session.getAttribute("userid") == null) {
		
		%> 
			<style>
				#public-user {
				display: block;
				}
				
				#reg-user {
				display: none;
				}
			</style>
		<%
	} else {
		%>
			<style>
				#public-user {
				display: none;
				}
				
				#reg-user {
				display: display;
				}
			</style>		
		
		<%
	}
	

%>

<body>
<div class ="nav-container">
	<div class="nav-brand">
		<a href="index.jsp">Zalada.</a>
	</div>

	<div class="main-nav">
	
		<div class="nav-col">
			<a href="index.jsp">Home</a>
		</div>
		<div class="nav-col">
			<a href="products.jsp">Products</a>
		</div>
			
		<div class="nav-col" id="public-user">
			<a href="login.jsp">Sign in / Register</a>
		</div>
		
		<div class="nav-col" id="reg-user" style="text-align: center;">
		<div class="dropdown">
			<a class="dropbtn" href="accountPage.jsp">Account</a>
				<div class="dropdown-content" >
					<a href="orders.jsp">Past Orders</a>
				</div>
			</div>
		</div>
			
		<div class="nav-col" id="reg-user">
			<form action="logout.jsp"><input type="submit" value="Logout" id="logoutBtn"></form>
		</div>
		
		<div class="nav-col">
			<a href="cart.jsp">Cart</a>
		</div>

	</div>
</div>

<div class="container">
	<div class="row-motd">
		<a>FREE SHIPPING FOR ORDERS ABOVE $50</a>
	</div>
</div>
</body>

</html>