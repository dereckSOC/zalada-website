<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="css/styles.css"type="text/css"/>
<meta charset="ISO-8859-1">


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
 .container-footer {
	background: rgb(247, 147, 30);
	display: flex;
	width: 100%;
	padding-top: 40px;
	padding-bottom: 20px;
	justify-content: center;
	
	/* Fix the footer at the bottom
	position: fixed;
	bottom: 0;
	 */
	}
	
	.container {
		display: flex;
		justify-content: center;
	}
 </style>
<body>
<%@ include file = "header.jsp" %>

	<div class="container">
	
		<div class="row-product">
		
			<div class="col-product">
				<a href="productCategory.jsp?productCategory=1"><img src="images/men.jpg"></a>
			</div>
			<div class="col-product">
				<a href="productCategory.jsp?productCategory=2"><img src="images/women.jpg"></a>
			</div>
			<div class="col-product">
				<a href="productCategory.jsp?productCategory=3"><img src="images/kids.jpg"></a>
			</div>
			
		</div>
		
	</div>

<%@ include file = "footer.jsp" %>
</body>
</html>