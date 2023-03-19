<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@page import ="dbaccess.*"%>
<%@page import ="java.sql.*" %>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="css/styles.css"type="text/css"/>
<link href="https://fonts.googleapis.com/css2?family=Amiri:ital,wght@1,700&family=Pacifico&family=Roboto:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Libre+Franklin&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@400;700&display=swap" rel="stylesheet">

<%
	
	String msg = (String)request.getAttribute("msg");
	
	if (msg == "invalidlogin") {
		response.sendRedirect("CA2/public/login.jsp?errCode=invalidLogin");
	}
	else if(msg =="emptyInput"){
		response.sendRedirect("CA2/public/login.jsp?errCode=emptyInput");

	}
	else if(msg== "createdUser"){
		response.sendRedirect("CA2/public/login.jsp");
	}
	else if(msg == "usernameExists"){
		response.sendRedirect("CA2/public/login.jsp?errCode=takenName");
	}
	else if(msg == "pwdNo"){
		response.sendRedirect("CA2/public/login.jsp?errCode=pwdNo");

	}

%>
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
 	background-image: url(images/loginbg.jpg);
 	-webkit-background-size: cover;
  	-moz-background-size: cover;
  	-o-background-size: cover;
  	background-size: cover;
 }
 
 .container {
 	display: flex;
 	justify-content: center;
 }
 
 .container-footer {
	background: rgb(247, 147, 30);
	display: flex;
	width: 100%;
	padding-top: 40px;
	padding-bottom: 20px;
	justify-content: center;
	
	/* Fix the footer at the bottom */
	position: fixed;
	bottom: 0;
}

#one-edge-shadow {
 box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
 </style>
 
<body>

<%@ include file = "header.jsp" %>
<%
// sets input from "errCode" to "message" variable
String message = request.getParameter("errCode");
%>

<div class="container">

	<div class="row-login">
	
		
		<div class="login" id="one-edge-shadow">
			<div class="login-left">
			
				<div class="login-left-header">
					<a><b>Hello, Friend!</b></a><br>
					<a style="font-size: 15px;">Sign up to start using Zalada</a>
				</div>
				
				<form action="../../RegisterServlet">
				
					<div class="reg-layout">
						<input type="text" name="username" placeholder="Username">
					</div>
					
					<div class="reg-layout">
						<input type="text" name="email" placeholder="Email">
					</div>
					
					<div class="reg-layout">
						<input type="tel" name="hp" placeholder="Phone Number">
					</div>
					
					<div class="reg-layout">
						<input type="password" name="pwd" placeholder="Password">
					</div>
					
					<div class="reg-layout">
						<input type="password" name="pwd2" placeholder="Re-enter Password">
					</div>
					
					<div class="reg-layout">
					<%
					if (message != null && message.equals("emptyInput")) {
						out.print("<a id='errorMsg'>Invalid Fields</a><br>");
					}
					else if (message != null && message.equals("takenName")) {
						out.print("<a id='errorMsg'>Username is already taken!</a><br>");
					} 
					
					else if (message != null && message.equals("pwdNo")) {
						out.print("<a id='errorMsg'>Passwords do not match!</a><br>");
					}
				%>
						<input type="submit" name="btnSubmit" value="SIGN UP">
					</div>
					
				</form>
				
			</div>
			
			<div class="login-right">
			
				<div class="login-right-header">
					<a><b>Sign In</b></a>
				</div>
			
				<form action="../../loginServlet">
				
					<div class="form-layout">
						<input type="text" name="loginid" placeholder="Username">
					</div>
					
					<div class="form-layout">
						<input type="password" name="pwd" placeholder="Password">
					</div>
						
					<div class="form-layout">	
						<%
							//checks whether there is an error
							if (message != null && message.equals("invalidLogin")) {
								out.print("<a id='errorMsg'>Invalid Login!</a><br>");
							}
						%>
						<input type="submit" name="btnSubmit" value="SIGN IN">
					</div>
				</form>
			</div>		
		</div>
			
		
	</div>
</div>


<%@ include file = "footer.jsp" %>
</body>
</html>