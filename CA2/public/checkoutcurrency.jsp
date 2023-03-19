<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="java.sql.*" %>
    <%@ page import="Product.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Zalada Online</title>
</head>
<link rel="stylesheet" href="CA2/public/css/styles.css"type="text/css"/>
<link href="https://fonts.googleapis.com/css2?family=Amiri:ital,wght@1,700&family=Pacifico&family=Roboto:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Libre+Franklin&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@400;700&display=swap" rel="stylesheet">
<!-- 
==========================================
J2EE Application Development Assignment 2
Name: Dereck Rupert Belda Zorca (1837689)
Name: Chng Yi Xuan (1935839)
DIT/FT/2A/01
==========================================
 -->
<body>
<%
	String rates = (String)request.getAttribute("rates");
	String currency = (String)request.getAttribute("currency");
%>
<script>
var txt = '<%=rates%>'
var obj = JSON.parse(txt);
var currency = '<%=currency%>'
var usd = 'USD';
var eur = 'EUR';
var cad = 'CAD';
var aud = 'AUD';
	if(currency == usd){
	var rates = obj.rates.USD
	window.location.href = "/JAD-CA2(yx)/CA2/public/checkout.jsp?rates=" + rates + "&currency=" + currency
	}
	else if(currency == eur){
		var rates = obj.rates.EUR
		window.location.href = "/JAD-CA2(yx)/CA2/public/checkout.jsp?rates=" + rates + "&currency=" + currency
	}
	else if(currency == cad){
		var rates = obj.rates.CAD
		window.location.href = "/JAD-CA2(yx)/CA2/public/checkout.jsp?rates=" + rates + "&currency=" + currency
	}
	else if(currency == aud){
		var rates = obj.rates.AUD
		window.location.href = "/JAD-CA2(yx)/CA2/public/checkout.jsp?rates=" + rates + "&currency=" + currency
	}
</script>
</body>
</html>