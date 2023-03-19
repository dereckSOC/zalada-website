<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="java.sql.*" %>
    <%@page import ="dbaccess.*" %>
    <%@page import ="Product.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="css/styles.css"type="text/css"/>
<link href="https://fonts.googleapis.com/css2?family=Amiri:ital,wght@1,700&family=Pacifico&family=Roboto:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Libre+Franklin&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@400;700&display=swap" rel="stylesheet">

<title>Zalada Online</title>
</head>

<style>
	.container-footer {
		/* Fix the footer at the bottom */
		position: fixed;
		bottom: 0;
	}
</style>
<%
/*
==========================================
J2EE Application Development Assignment 2
Name: Dereck Rupert Belda Zorca (1837689)
Name: Chng Yi Xuan (1935839)
DIT/FT/2A/01
==========================================
*/
String useridStr=request.getParameter("userid");
int userid = Integer.parseInt(useridStr);

int id=0;
String name="";
String pwd="";
String role="";
String hp="";
String email="";

//sets input from "errCode" to "message" variable
String message = request.getParameter("errCode");
%>

<%

UserDetailList c = CrudFunction.getUser(userid);

	id = c.getUserid();
	name = c.getUsername();
	pwd = c.getPassword();
	email = c.getEmail();
	hp = c.getPhoneNumber();
	role = c.getRole();

%>
<body>
<%@ include file = "header.jsp" %>

	<div class="container">
	
		<div class="editProduct" id="shadow">
		
			<div class="editProduct-Header">
				<a><b>Edit User: <%=name %></b></a>
			</div>
			
			<div class="editProduct-Form" >
				<form action="../../adminUpdateAccount" method="POST">
					<table>
						<tr>
							<td id="left-td">User ID:</td>
							<td id="right-td"><input type='text' name ='userid' value='<%=userid %>'readonly="readonly"/></td>
						</tr>
						<tr>
							<td id="left-td">Username:</td>
							<td id="right-td"><input type='text' name ='name' value='<%=name %>'/></td>
						</tr>
						<tr>
							<td id="left-td">Email:</td>
							<td id="right-td"><input type='text' name ='email' value='<%=email %>'/></td>
						</tr>
						<tr>
							<td id="left-td">Phone Number:</td>
							<td id="right-td"><input type='tel' name ='hp' value='<%=hp %>'/></td>
						</tr>
						<tr>
							<td id="left-td">Password:</td>
							<td id="right-td"><input type='text' name ='pwd' value='<%=pwd %>'/></td>
						</tr>
						<tr>
							<td id="left-td">Set Role:</td>
							<td id="right-td">
							<%
								if (role.equals("admin")) {
									%>
									<input type='radio' name ='role' value='admin' checked/>admin
									<input type='radio' name ='role' value='user'/>user
									<%
								} else {
									%>
									<input type='radio' name ='role' value='admin'/>admin
									<input type='radio' name ='role' value='user' checked/>user									
									<%
								}
							%>

							</td>
						</tr>
						<tr>
							<td colspan='2' align='center'>
								<%
								if (message != null && message.equals("success")) {
									out.print("<a id='errorMsg' style='color:green; text-align: center'>Successfully Updated!</a><br>");
								}
								else if (message != null && message.equals("error")) {
									out.print("<a id='errorMsg' style='text-align: center'>Error Has Occurred!</a><br>");
								}
								%>
							</td>
						</tr>
						<tr>
							<td colspan='2' align='center'><input type='submit' value='Update User' /></td>
						</tr>
					</table>
				</form>
			</div>
			
		</div>
	</div>
	<%@ include file = "footer.jsp" %>
</body>
</html>