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
 -->


<%

if(session.getAttribute("username") == null || session.getAttribute("username").equals("")){
	response.sendRedirect("index.jsp");

}
else{
// sets input from "errCode" to "message" variable
String message = request.getParameter("code");
String username = String.valueOf(session.getAttribute("username"));
String role = String.valueOf(session.getAttribute("role"));


if (role.equals("admin") ) {
	%>
		<style>
			#admin {
			display: block;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			}
		</style>
		
	<%
} else {
	%>
	<style>
		#admin {
			display: none;
		}

		
	</style>
	<%
}

%>
<%
String msg = (String)request.getAttribute("msg");
String email = (String)session.getAttribute("email");
String hp = (String)session.getAttribute("hp");

ArrayList<Products> productList = CrudFunction.getAllProducts();
ArrayList<UserDetailList> userList = CrudFunction.getAllUsers();

UserAddress a = (UserAddress)session.getAttribute("address");

if (msg == "prodAdd") {
	response.sendRedirect("CA2/public/accountPage.jsp?code=prodAdd");
}
else if(msg == "prodInvalid"){
	response.sendRedirect("CA2/public/accountPage.jsp?code=prodInvalid");
}
%>
<body>
<%@ include file = "header.jsp" %>
	<div class="container">
		<div class="row-acc">
			<div class="row-details" id="shadow">
				<div class="acc-head">
					<a><b>Personal Details</b></a><br>
				</div>
				<div class="displayName">
					<div class="user-wrap">
						<a><b>Username:</b></a> 
					</div>
					<div class="name-wrap">
						<a><%=username %></a>
					</div>					
				</div>
				<div class="updateUser">
					<form action="../../updateAccount" method="POST">
						<div class="updateContact">
							<a><b>Update Contact Information</b></a>
							<div class="updateRow" style="margin-top: 20px;">
								<a>Email Address:</a>
								<input name="email" type="text" value="<%=email%>">
							</div>
							<div class="updateRow" style="margin-bottom: 20px;">
								<a>Phone Number:</a>
								<input name="hp" type="tel" value="<%=hp%>">
							</div>						
						</div>
						<div class="updatePwd">
							<a><b>Update Password</b></a>
							<div class="updateRow" style="margin-top: 20px;">
								<a>Password:</a>
								<input name="pwd" type="password">
							</div>
							<div class="updateRow">
								<a>Re-Enter Password:</a>
								<input name="pwd2" type="password">
							</div>
						</div>
				<%		//checks whether there is an error
					if (message != null && message.equals("err")) {
						out.print("<a id='errorMsg'>Passwords Do Not Match!</a><br>");
					}
					else if ((message != null && message.equals("success"))) {
						out.print("<a id='errorMsg' style='color:green;'>Successfully Changed!</a><br>");
					}
					else if ((message != null && message.equals("err1"))) {
						out.print("<a id='errorMsg'>Invalid Changes</a><br>");
					}
				%>
						<input type="submit" name="btnUpdate" value="Update Personal Information">
					</form>
				</div> 
			</div>
		</div>
		
		<div class="row-acc">
			<div class="row-details" id="shadow">
				<div class="acc-head">
					<a><b>Shipping Address</b></a><br>
				</div>
				<div class="updateUser">
					<form action="../../updateAddress" method="POST">
						<div class="wrapper">
							<div class="nameInput" style="display: flex; flex-direction: row; margin-top: 20px; justify-content: space-between">
								<div class="dualInput" style="width: 50%; text-align: left">
									<a>First Name</a>
									<input type="text" name="firstName" value="<%=a.getFirstname()%>">
								</div>
								<div class="dualInput" style="width: 50%; text-align: left">
									<a>Last Name</a>
									<input type="text" name="lastName" value="<%=a.getLastname()%>">
								</div>
							</div>
							<div class="contactInfoInput" style="width: 100%;">
								<a>Phone Number</a>
								<input type="number" name="phone" value="<%=a.getPhonenumber()%>">
							</div>
							<div class="contactInfoInput" style="width: 100%;">
								<a>Address Line 1</a>
								<input type="text" name="addressLn1" value="<%=a.getAddressLn1()%>">
							</div>
							<div class="contactInfoInput" style="width: 100%;">
								<a>Address Line 2 (Optional)</a>
								<input type="text" name="addressLn2" value="<%=a.getAddressLn2()%>">
							</div>			
							<div class="contactInfoInput" style="width: 100%;">
								<a>City</a>
								<input type="text" name="city" value="<%=a.getCity()%>">
							</div>
							<div class="nameInput" style="display: flex; flex-direction: row; align-item: baseline; justify-content: space-between">
								<div class="dualInput" style="width: 100%; text-align: left">
									<a>Country</a>
									<select id="country" name="country" style="font-size: 11.7px">
									   <option value="<%=a.getCountry()%>" selected="selected"><%=a.getCountry()%></option>	
									   <option value="Afganistan">Afghanistan</option>
									   <option value="Albania">Albania</option>
									   <option value="Algeria">Algeria</option>
									   <option value="American Samoa">American Samoa</option>
									   <option value="Andorra">Andorra</option>
									   <option value="Angola">Angola</option>
									   <option value="Anguilla">Anguilla</option>
									   <option value="Antigua & Barbuda">Antigua & Barbuda</option>
									   <option value="Argentina">Argentina</option>
									   <option value="Armenia">Armenia</option>
									   <option value="Aruba">Aruba</option>
									   <option value="Australia">Australia</option>
									   <option value="Austria">Austria</option>
									   <option value="Azerbaijan">Azerbaijan</option>
									   <option value="Bahamas">Bahamas</option>
									   <option value="Bahrain">Bahrain</option>
									   <option value="Bangladesh">Bangladesh</option>
									   <option value="Barbados">Barbados</option>
									   <option value="Belarus">Belarus</option>
									   <option value="Belgium">Belgium</option>
									   <option value="Belize">Belize</option>
									   <option value="Benin">Benin</option>
									   <option value="Bermuda">Bermuda</option>
									   <option value="Bhutan">Bhutan</option>
									   <option value="Bolivia">Bolivia</option>
									   <option value="Bonaire">Bonaire</option>
									   <option value="Bosnia & Herzegovina">Bosnia & Herzegovina</option>
									   <option value="Botswana">Botswana</option>
									   <option value="Brazil">Brazil</option>
									   <option value="British Indian Ocean Ter">British Indian Ocean Ter</option>
									   <option value="Brunei">Brunei</option>
									   <option value="Bulgaria">Bulgaria</option>
									   <option value="Burkina Faso">Burkina Faso</option>
									   <option value="Burundi">Burundi</option>
									   <option value="Cambodia">Cambodia</option>
									   <option value="Cameroon">Cameroon</option>
									   <option value="Canada">Canada</option>
									   <option value="Canary Islands">Canary Islands</option>
									   <option value="Cape Verde">Cape Verde</option>
									   <option value="Cayman Islands">Cayman Islands</option>
									   <option value="Central African Republic">Central African Republic</option>
									   <option value="Chad">Chad</option>
									   <option value="Channel Islands">Channel Islands</option>
									   <option value="Chile">Chile</option>
									   <option value="China">China</option>
									   <option value="Christmas Island">Christmas Island</option>
									   <option value="Cocos Island">Cocos Island</option>
									   <option value="Colombia">Colombia</option>
									   <option value="Comoros">Comoros</option>
									   <option value="Congo">Congo</option>
									   <option value="Cook Islands">Cook Islands</option>
									   <option value="Costa Rica">Costa Rica</option>
									   <option value="Cote DIvoire">Cote DIvoire</option>
									   <option value="Croatia">Croatia</option>
									   <option value="Cuba">Cuba</option>
									   <option value="Curaco">Curacao</option>
									   <option value="Cyprus">Cyprus</option>
									   <option value="Czech Republic">Czech Republic</option>
									   <option value="Denmark">Denmark</option>
									   <option value="Djibouti">Djibouti</option>
									   <option value="Dominica">Dominica</option>
									   <option value="Dominican Republic">Dominican Republic</option>
									   <option value="East Timor">East Timor</option>
									   <option value="Ecuador">Ecuador</option>
									   <option value="Egypt">Egypt</option>
									   <option value="El Salvador">El Salvador</option>
									   <option value="Equatorial Guinea">Equatorial Guinea</option>
									   <option value="Eritrea">Eritrea</option>
									   <option value="Estonia">Estonia</option>
									   <option value="Ethiopia">Ethiopia</option>
									   <option value="Falkland Islands">Falkland Islands</option>
									   <option value="Faroe Islands">Faroe Islands</option>
									   <option value="Fiji">Fiji</option>
									   <option value="Finland">Finland</option>
									   <option value="France">France</option>
									   <option value="French Guiana">French Guiana</option>
									   <option value="French Polynesia">French Polynesia</option>
									   <option value="French Southern Ter">French Southern Ter</option>
									   <option value="Gabon">Gabon</option>
									   <option value="Gambia">Gambia</option>
									   <option value="Georgia">Georgia</option>
									   <option value="Germany">Germany</option>
									   <option value="Ghana">Ghana</option>
									   <option value="Gibraltar">Gibraltar</option>
									   <option value="Great Britain">Great Britain</option>
									   <option value="Greece">Greece</option>
									   <option value="Greenland">Greenland</option>
									   <option value="Grenada">Grenada</option>
									   <option value="Guadeloupe">Guadeloupe</option>
									   <option value="Guam">Guam</option>
									   <option value="Guatemala">Guatemala</option>
									   <option value="Guinea">Guinea</option>
									   <option value="Guyana">Guyana</option>
									   <option value="Haiti">Haiti</option>
									   <option value="Hawaii">Hawaii</option>
									   <option value="Honduras">Honduras</option>
									   <option value="Hong Kong">Hong Kong</option>
									   <option value="Hungary">Hungary</option>
									   <option value="Iceland">Iceland</option>
									   <option value="Indonesia">Indonesia</option>
									   <option value="India">India</option>
									   <option value="Iran">Iran</option>
									   <option value="Iraq">Iraq</option>
									   <option value="Ireland">Ireland</option>
									   <option value="Isle of Man">Isle of Man</option>
									   <option value="Israel">Israel</option>
									   <option value="Italy">Italy</option>
									   <option value="Jamaica">Jamaica</option>
									   <option value="Japan">Japan</option>
									   <option value="Jordan">Jordan</option>
									   <option value="Kazakhstan">Kazakhstan</option>
									   <option value="Kenya">Kenya</option>
									   <option value="Kiribati">Kiribati</option>
									   <option value="Korea North">Korea North</option>
									   <option value="Korea Sout">Korea South</option>
									   <option value="Kuwait">Kuwait</option>
									   <option value="Kyrgyzstan">Kyrgyzstan</option>
									   <option value="Laos">Laos</option>
									   <option value="Latvia">Latvia</option>
									   <option value="Lebanon">Lebanon</option>
									   <option value="Lesotho">Lesotho</option>
									   <option value="Liberia">Liberia</option>
									   <option value="Libya">Libya</option>
									   <option value="Liechtenstein">Liechtenstein</option>
									   <option value="Lithuania">Lithuania</option>
									   <option value="Luxembourg">Luxembourg</option>
									   <option value="Macau">Macau</option>
									   <option value="Macedonia">Macedonia</option>
									   <option value="Madagascar">Madagascar</option>
									   <option value="Malaysia">Malaysia</option>
									   <option value="Malawi">Malawi</option>
									   <option value="Maldives">Maldives</option>
									   <option value="Mali">Mali</option>
									   <option value="Malta">Malta</option>
									   <option value="Marshall Islands">Marshall Islands</option>
									   <option value="Martinique">Martinique</option>
									   <option value="Mauritania">Mauritania</option>
									   <option value="Mauritius">Mauritius</option>
									   <option value="Mayotte">Mayotte</option>
									   <option value="Mexico">Mexico</option>
									   <option value="Midway Islands">Midway Islands</option>
									   <option value="Moldova">Moldova</option>
									   <option value="Monaco">Monaco</option>
									   <option value="Mongolia">Mongolia</option>
									   <option value="Montserrat">Montserrat</option>
									   <option value="Morocco">Morocco</option>
									   <option value="Mozambique">Mozambique</option>
									   <option value="Myanmar">Myanmar</option>
									   <option value="Nambia">Nambia</option>
									   <option value="Nauru">Nauru</option>
									   <option value="Nepal">Nepal</option>
									   <option value="Netherland Antilles">Netherland Antilles</option>
									   <option value="Netherlands">Netherlands (Holland, Europe)</option>
									   <option value="Nevis">Nevis</option>
									   <option value="New Caledonia">New Caledonia</option>
									   <option value="New Zealand">New Zealand</option>
									   <option value="Nicaragua">Nicaragua</option>
									   <option value="Niger">Niger</option>
									   <option value="Nigeria">Nigeria</option>
									   <option value="Niue">Niue</option>
									   <option value="Norfolk Island">Norfolk Island</option>
									   <option value="Norway">Norway</option>
									   <option value="Oman">Oman</option>
									   <option value="Pakistan">Pakistan</option>
									   <option value="Palau Island">Palau Island</option>
									   <option value="Palestine">Palestine</option>
									   <option value="Panama">Panama</option>
									   <option value="Papua New Guinea">Papua New Guinea</option>
									   <option value="Paraguay">Paraguay</option>
									   <option value="Peru">Peru</option>
									   <option value="Phillipines">Philippines</option>
									   <option value="Pitcairn Island">Pitcairn Island</option>
									   <option value="Poland">Poland</option>
									   <option value="Portugal">Portugal</option>
									   <option value="Puerto Rico">Puerto Rico</option>
									   <option value="Qatar">Qatar</option>
									   <option value="Republic of Montenegro">Republic of Montenegro</option>
									   <option value="Republic of Serbia">Republic of Serbia</option>
									   <option value="Reunion">Reunion</option>
									   <option value="Romania">Romania</option>
									   <option value="Russia">Russia</option>
									   <option value="Rwanda">Rwanda</option>
									   <option value="St Barthelemy">St Barthelemy</option>
									   <option value="St Eustatius">St Eustatius</option>
									   <option value="St Helena">St Helena</option>
									   <option value="St Kitts-Nevis">St Kitts-Nevis</option>
									   <option value="St Lucia">St Lucia</option>
									   <option value="St Maarten">St Maarten</option>
									   <option value="St Pierre & Miquelon">St Pierre & Miquelon</option>
									   <option value="St Vincent & Grenadines">St Vincent & Grenadines</option>
									   <option value="Saipan">Saipan</option>
									   <option value="Samoa">Samoa</option>
									   <option value="Samoa American">Samoa American</option>
									   <option value="San Marino">San Marino</option>
									   <option value="Sao Tome & Principe">Sao Tome & Principe</option>
									   <option value="Saudi Arabia">Saudi Arabia</option>
									   <option value="Senegal">Senegal</option>
									   <option value="Seychelles">Seychelles</option>
									   <option value="Sierra Leone">Sierra Leone</option>
									   <option value="Singapore">Singapore</option>
									   <option value="Slovakia">Slovakia</option>
									   <option value="Slovenia">Slovenia</option>
									   <option value="Solomon Islands">Solomon Islands</option>
									   <option value="Somalia">Somalia</option>
									   <option value="South Africa">South Africa</option>
									   <option value="Spain">Spain</option>
									   <option value="Sri Lanka">Sri Lanka</option>
									   <option value="Sudan">Sudan</option>
									   <option value="Suriname">Suriname</option>
									   <option value="Swaziland">Swaziland</option>
									   <option value="Sweden">Sweden</option>
									   <option value="Switzerland">Switzerland</option>
									   <option value="Syria">Syria</option>
									   <option value="Tahiti">Tahiti</option>
									   <option value="Taiwan">Taiwan</option>
									   <option value="Tajikistan">Tajikistan</option>
									   <option value="Tanzania">Tanzania</option>
									   <option value="Thailand">Thailand</option>
									   <option value="Togo">Togo</option>
									   <option value="Tokelau">Tokelau</option>
									   <option value="Tonga">Tonga</option>
									   <option value="Trinidad & Tobago">Trinidad & Tobago</option>
									   <option value="Tunisia">Tunisia</option>
									   <option value="Turkey">Turkey</option>
									   <option value="Turkmenistan">Turkmenistan</option>
									   <option value="Turks & Caicos Is">Turks & Caicos Is</option>
									   <option value="Tuvalu">Tuvalu</option>
									   <option value="Uganda">Uganda</option>
									   <option value="United Kingdom">United Kingdom</option>
									   <option value="Ukraine">Ukraine</option>
									   <option value="United Arab Erimates">United Arab Emirates</option>
									   <option value="United States of America">United States of America</option>
									   <option value="Uraguay">Uruguay</option>
									   <option value="Uzbekistan">Uzbekistan</option>
									   <option value="Vanuatu">Vanuatu</option>
									   <option value="Vatican City State">Vatican City State</option>
									   <option value="Venezuela">Venezuela</option>
									   <option value="Vietnam">Vietnam</option>
									   <option value="Virgin Islands (Brit)">Virgin Islands (Brit)</option>
									   <option value="Virgin Islands (USA)">Virgin Islands (USA)</option>
									   <option value="Wake Island">Wake Island</option>
									   <option value="Wallis & Futana Is">Wallis & Futana Is</option>
									   <option value="Yemen">Yemen</option>
									   <option value="Zaire">Zaire</option>
									   <option value="Zambia">Zambia</option>
									   <option value="Zimbabwe">Zimbabwe</option>
									</select>
								</div>
								<div class="dualInput" style="padding-left: 10px; margin-bottom: 20px; width: 50%; text-align: left">
									<a>Postal Code</a>
									<input type="text" name="postal" value="<%=a.getPostalcode()%>">
								</div>			
							</div>
						</div>
						<%		//checks whether there is an error
							if (message != null && message.equals("invalidInput")) {
								out.print("<a id='errorMsg'>Error Updating!</a><br>");
							}
							else if ((message != null && message.equals("successAddr"))) {
								out.print("<a id='errorMsg' style='color:green;'>Successfully changed!</a><br>");
							}
						%>
						<input type="submit" name="btnUpdate" value="Update Shipping Address">
					</form>
				</div> 
			</div>
		</div>
		
		<div class="row-admin" >
			<div class="row-details-admin" id="admin">
				<div class="admin-head">
					<a><b>Administrator Panel</b></a><br>
				</div>
				
				<button id="cProductBtn" type="button" class="collapsible">Create Product</button>
				<div class="cProduct">
					<form action="../../postProductServlet">
						

						
						<div class="productWrap">
							<a>Product Name</a>
							<input type="text" name="name">
						</div>
						
						<div class="productWrap">
							<a>Brief Description</a>
							<input type="text" name="briefdesc">						
						</div>

						<div class="productWrap">
							<a>Detailed Description</a>
							<input type="text" name="detaildesc">						
						</div>	
						
						<div class="productWrap">
							<a>Category</a>
							<input type="text" name="category">
						</div>	
						
						<div class="numRow">
							<div class="productWrap">
								<a>Cost Price($)</a>
								<input type="number" name="costprice" min="0">													
							</div>

							<div class="productWrap">
								<a>Retail Price($)</a>
								<input type="number" name="retailprice" min="0">						
							</div>

							<div class="productWrap">
								<a>Stock Count</a>
								<input type="number" name="stock" min="1">						
							</div>
						</div>
						<div class="productWrap">
							<a>Image Location:</a>
							<input type="text" name="image">
						</div>	<%
						//checks whether there is an error
					if (message != null && message.equals("proInvalid")) {
						out.print("<a id='errorMsg'>Error has occurred!</a><br>");
					}
					else if ((message != null && message.equals("prodAdd"))) {
						out.print("<a id='errorMsg' style='color:green;'>Successfully Added!</a><br>");
					}
				%>
							<input type="submit" value='Create Product' />
					</form>
				</div>
				
				<button id="vProductBtn" type="button" class="collapsible2">Manage Products</button>
				<div class="vProduct">
					<table>
						<tr>
							<th id="tbSort" ><b>View All By</b></th>
							<th id="tbSort" ></th>
							<th id="tbSort" ><a href="top5sold.jsp">Most Sold</a></th>
							<th id="tbSort" ><a href="bottom5sold.jsp">Least Sold</a></th>
							<th id="tbSort" ><a href="lowStock.jsp">Low Stock</a></th>
						</tr>
						<tr>
							<th>Product ID</th>
							<th>Product Name</th>
							<th>Action #1</th>
							<th>Action #2</th>
							<th>Action #3</th>
						</tr>
					<%
						for (Products c: productList) {
							 int productid = c.getProductid();
							 String name = c.getName();
					%>
					
					
					
						<tr>
							<td><%=productid%></td>
							<td><%=name %></td>
							<td style="background: none;"><a href="../../DeleteProduct?productid=<%=productid %>"><button><b>Delete</b></button></a></td>
							<td style="background: none;"><a href="editProductListings.jsp?productid=<%=productid %>"><button><b>Edit</b></button></a></td>
							<td style="background: none;"><a href="checkPurchases.jsp?productid=<%=productid %>&name=<%=name%>"><button><b>Purchased By</b></button></a></td>
							
						</tr>
					<%
						}
					%>
					</table>
				</div>
				<button id="manageUserBtn" type="button" class="collapsible3">Manage Users</button>
				<div class="vProduct">
					<table>
						<tr>
							<th id="tbSort" ><b>View All By</b></th>
							<th id="tbSort" ></th>
							<th id="tbSort" ><a href="customerAddress.jsp">See Address</a></th>
							<th id="tbSort" ><a href="customerPurchaseValue.jsp">See Top Purchasers</a></th>
						</tr>
						<tr>
							<th>User ID</th>
							<th>Username</th>
							<th>Action #1</th>
							<th>Action #2</th>
						</tr>
					<%
						int manageUserid;
						String manageUsername;

						for (UserDetailList c: userList) {
							 int useridUpdate = c.getUserid();
							 String usernameUpdate = c.getUsername();
					%>	
						<tr>
							<td><%=useridUpdate%></td>
							<td><%=usernameUpdate %></td>
							<td style="background: none;"><a href="../../deleteUser?userid=<%=useridUpdate%>"><button><b>Delete</b></button></a></td>
							<td style="background: none;"><a href="adminEditUser.jsp?userid=<%=useridUpdate%>"><button><b>Edit</b></button></a></td>
						</tr>
					<%
						}
					%>
					</table>
				</div>
				<button id="vProductBtn" type="button" class="collapsible4">Search Orders by Month</button>
					<div class="vProduct">
					<form action="orderDate.jsp" style="padding: 6em;">
					  <label for="month">Month:</label>
					  <select name="month" id="month">
					    <optgroup label="Select Month">
					      <option value="2020-01%">January</option>
					      <option value="2020-02%">February</option>
					      <option value="2020-03%">March</option>
					      <option value="2020-04%">April</option>
					      <option value="2020-05%">May</option>
					      <option value="2020-06%">June</option>
					      <option value="2020-07%">July</option>
					      <option value="2020-08%">August</option>
					      <option value="2020-09%">September</option>
					      <option value="2020-10%">October</option>
					      <option value="2020-11%">November</option>
					      <option value="2020-12%">December</option>
					      <option value="%">All Orders</option>
					
					    </optgroup>
					  </select>
					  <br><br>
					  <input type="submit" value="Submit">
					</form>

				</div>
			</div>
		</div>
	</div>
<%} %>
<%@ include file = "footer.jsp" %>
</body>
<script>
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.maxHeight){
      content.style.maxHeight = null;
    } else {
      content.style.maxHeight = content.scrollHeight + "px";
    }
  });
}

var coll = document.getElementsByClassName("collapsible2");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.maxHeight){
      content.style.maxHeight = null;
    } else {
      content.style.maxHeight = content.scrollHeight + "px";
    }
  });
}

var coll = document.getElementsByClassName("collapsible3");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.maxHeight){
      content.style.maxHeight = null;
    } else {
      content.style.maxHeight = content.scrollHeight + "px";
    }
  });
}
var coll = document.getElementsByClassName("collapsible4");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.maxHeight){
      content.style.maxHeight = null;
    } else {
      content.style.maxHeight = content.scrollHeight + "px";
    }
  });
}

</script>
</html>