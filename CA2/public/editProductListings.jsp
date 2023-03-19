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

<meta charset="ISO-8859-1">

<!-- 
==========================================
J2EE Application Development Assignment 2
Name: Dereck Rupert Belda Zorca (1837689)
Name: Chng Yi Xuan (1935839)
DIT/FT/2A/01
==========================================
 -->
<title>Zalada Online</title>
<style>
#shadow {
 	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
</style>
<body>
<%@ include file = "header.jsp" %>
<%
/*
==========================================
J2EE Application Development Assignment 1
Name: Dereck Rupert Belda Zorca (1837689)
Name: Chng Yi Xuan (1935839)
DIT/FT/2A/01
==========================================
*/
String productidStr=request.getParameter("productid");
int productid = Integer.parseInt(productidStr);
int id=0;
String name="";
String briefdesc="";
String detaildesc="";
String costprice="";
String retailprice="";
int stock=0;
int category=0;
String image="";
//sets input from "errCode" to "message" variable
String message = request.getParameter("errCode");
Products a = CrudFunction.getProduct(productid);

name = a.getName();
briefdesc = a.getBriefDesc();
detaildesc = a.getDetailDesc();
costprice = a.getCostPrice();
retailprice = a.getRetailPrice();
stock = a.getStock();
category = a.getCategoryID();
image = a.getImage();
%>
	<div class="container">
	
		<div class="editProduct" id="shadow">
		
			<div class="editProduct-Header">
				<a><b>Edit Product</b></a>
			</div>
			
			<div class="editProduct-Form" >
				<form action="../../updateListings" method="POST">
					<table>
						<tr>
							<td id="left-td">Product ID:</td>
							<td id="right-td"><input type='text' name ='productid' value='<%=productid %>'readonly="readonly"/></td>
						</tr>
						<tr>
							<td id="left-td">Product Name:</td>
							<td id="right-td"><input type='text' name ='productname' value='<%=name %>'/></td>
						</tr>
						<tr>
							<td id="left-td">Brief Description:</td>
							<td id="right-td"><input type='text' name ='briefdesc' value='<%=briefdesc %>'/></td>
						</tr>
						<tr>
							<td id="left-td">Detailed Description:</td>
							<td id="right-td"><input type='text' name ='detaildesc' value='<%=detaildesc %>'/></td>
						</tr>
						<tr>
							<td id="left-td">Cost Price:</td>
							<td id="right-td"><input type='text' name ='costprice' value='<%=costprice %>'/></td>
						</tr>
						<tr>
							<td id="left-td">Retail Price:</td>
							<td id="right-td"><input type='text' name ='retailprice' value='<%=retailprice %>'/></td>
						</tr>
						<tr>
							<td id="left-td">Stock Count:</td>
							<td id="right-td"><input type='text' name ='stock' value='<%=stock %>'/></td>
						</tr>
						<tr>
							<td id="left-td">Category ID:</td>
							<td id="right-td"><input type='text' name ='category' value='<%=category %>'/></td>
						</tr>
						<tr>
							<td id="left-td">Image Location:</td>
							<td id="right-td"><input type='text' name ='image' value='<%=image %>'/></td>
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
							<td colspan='2' align='center'><input type='submit' value='Update Listing' /></td>
						</tr>
					</table>
				</form>
			</div>
			
		</div>
	</div>
<%@ include file = "footer.jsp" %>
</body>
</html>