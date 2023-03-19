<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="java.sql.*" %>
    <%@page import ="dbaccess.*" %>
    <%@page import ="Product.*" %>
    <%@page import= "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Zalada Online</title>
</head>
<link rel="stylesheet" href="css/styles.css"type="text/css"/>
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
 --> -->


<%

if(session.getAttribute("username") == null || session.getAttribute("username").equals("")){
	response.sendRedirect("index.jsp");

}
int userid = (int)session.getAttribute("userid");
String username = String.valueOf(session.getAttribute("username"));
String role = String.valueOf(session.getAttribute("role"));

ArrayList<String> receiptList = OrderHistory.ReceiptIDList(userid);
if (receiptList.size() == 0) {
	
	%> 
		<style>
			#check {
				display: block;
				box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			}
		</style>
	<%
} else {
	%>
		<style>
			#check {
				display: none;
			}
		</style>		
	
	<%
}


%>


<style>

	
	html, body {
		height: 100%
	}
	
	.containerOrder {
		min-height: 100%
	}
	
	.row-acc {
		overflow: auto;
		padding-bottom: 10px;
	}	
	
	.container-footer {
		position: relative;
		height: auto;
		margin-top: -10px;
		clear: both;
	}
	
</style>
<body>
<%@ include file = "header.jsp" %>

<div class="containerOrder" style="flex:display; justify-content: center; align-items: center;">
	<div class="row-acc">
		<div class="row-details" style="background-color: rgb(248,248,248);">
			<div class="acc-head" style="text-align: center; margin-bottom: 0">
				<a><b>Order History</b></a><br>
			</div>
			<div class="orderListEmpty" style="background-color: white;" id="check">
				<a><b>You have no orders</b></a>
			</div>
			<div class="orderList" >
				<% for (String r: receiptList) { 
					double totalprice=0.0;
					String shippingFee="";
				%>
					<div class="orderList-Row" style="background-color: white;" id="shadow">
						<a style="padding-right: 20px;"><b>Receipt ID:</b></a>
						<a style="float: right; padding-left: 20px;"><%=r %></a>
						<% ArrayList<OrderList> orderList = OrderHistory.getOrders(r);
						for (OrderList order: orderList ){
							int id = order.getProductid();
							ArrayList<ProductOrder> productDB = OrderHistory.getProductDB(id);
							for (ProductOrder a: productDB){ 
								totalprice = totalprice + Double.parseDouble(order.getProductprice());
								shippingFee = order.getShippingFee();
							%>
								<div class="orderListLoop">
									<img src="<%=a.getImage()%>"/>
									<a><%=a.getName() %></a>
									<a><%=a.getBriefDesc() %></a>
									<a>x<%=order.getQty() %></a>
									<a style="padding-right: 10px;">$<%=order.getProductprice() %></a>
								</div>
							<% } %>
						<% } %>
						<a style="padding-right: 20px;"><b>Shipping Fee:</b></a>
						<a style="float: right; padding-left: 20px;"><%=shippingFee %></a><br>
						<a style="padding-right: 20px;"><b>Sub-Total (excl. Shipping Fee):</b></a>
						<a style="float: right; padding-left: 20px;">$<%=String.format("%.2f", totalprice) %></a>
						
						
					</div>
						
					<%}%>

			</div> 
		</div>
	</div>
</div> 
<%@ include file = "footer.jsp" %>
</body>
</html>