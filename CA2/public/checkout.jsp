<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="java.sql.*" %>
    <%@ page import="dbaccess.*" %>
    <%@ page import="Product.Product" %>
    <%@ page import="java.util.*" %>
    
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
	String Stringrates = "";
	double rates = 1.0;
	String currency = "SGD";
	Stringrates = (String)request.getParameter("rates");
	currency = (String)request.getParameter("currency");
	if(Stringrates != null && Stringrates.length() > 0){
		rates = Double.parseDouble(Stringrates);
	}
	
%>

<%
double totalPrice = 0.0;
double gstPrice = 0.0;
String shippingFee = "";
double shipping = 0.0;
ArrayList<Product> shoppingCart = (ArrayList<Product>)session.getAttribute("shoppingCart");
String email, hp, firstname,lastname,phonenumber,addressln1,addressln2,city,country,postalcode;

if (session.getAttribute("email") == null) {
	email = "";
}
else {
	email = (String)session.getAttribute("email");
}

if (session.getAttribute("hp") == null) {
	hp = "";
}
else {
	hp = (String)session.getAttribute("hp");
}


if (session.getAttribute("address") == null) {
	firstname= "";
	lastname= "";
	phonenumber= "";
	addressln1= "";
	addressln2= ""; 
	city= "";
	country= "";
	postalcode = "";
}
else {
	UserAddress a = (UserAddress)session.getAttribute("address");
	firstname = a.getFirstname();
	lastname = a.getLastname();
	phonenumber = a.getPhonenumber();
	addressln1 = a.getAddressLn1();
	addressln2 = a.getAddressLn2();
	city = a.getCity();
	country = a.getCountry();
	postalcode = a.getPostalcode();
}
%>

<style>
	.main-nav {
		display: none;
	}
	
	.row-motd a {
		display: none;
	}
</style>

<body>

<%@ include file = "header.jsp" %>
	<div class="container" style="display: flex; flex-direction: row-reverse; justify-content: center;">
	<div class="checkOutForm">
			<div class="orderList">
			
				<div class="title-head" style="margin-bottom: 10px">
					<a><b>Your Order</b></a><br>
				</div>
				
					<% for (Product item: shoppingCart) {
				
					int id = item.getProductid();
					String name = item.getName();
					String briefdesc = item.getBriefDesc();
					String image = item.getImage();
					int qty = item.getQty();
					double retailprice = item.getRetailPrice();
					totalPrice = (totalPrice + retailprice * qty) * rates;
					
				%>
				<div class="itemLine" >	
					<img src="<%=image %>" style="width: 100px; height: 100px;"/>
					
					<div class="itemLineValue" style=" display: inline-flex; align-items: center; justify-content: space-around; width: 100%">
						<a><%=name %></a>
						<a>x<%=qty %></a>
						<a><b><%=currency%> <%=String.format("%.2f", (retailprice * qty * rates)) %></b></a>
					</div>

				</div>
				<% 
				} 
				gstPrice = totalPrice * 1.07;
				
				double gst = gstPrice - totalPrice;
				
				
			
				if (50 > totalPrice) {
					shippingFee = "$4.99";
					shipping = 4.99 * rates;
					gstPrice = gstPrice + shipping;
				}
				else {
					shippingFee="Free";
					shipping = 0.0;
				}
				
				String checkoutPrice = String.format("%.2f", gstPrice );
				
				session.setAttribute("shippingFee", shippingFee);
				session.setAttribute("checkoutPrice", checkoutPrice);
			%>

				<div class="cart-summary">
					<div class="currencyConvert" style="margin-top: 10px;">
						<a><b>Select a Currency: </b></a>
						<div class="currencyConvert-right" style="float: right; color: black;">
							<a href="checkout.jsp?currency=SGD" style="color: black">SGD</a>
							<a href="../../currencyConversionServlet?currency=USD" style="color: black; margin-right: 5px; margin-left: 5px;">USD</a>
							<a href="../../currencyConversionServlet?currency=EUR" style="color: black; margin-right: 5px; margin-left: 5px;">EUR</a>
							<a href="../../currencyConversionServlet?currency=CAD" style="color: black; margin-right: 5px; margin-left: 5px;">CAD</a>
							<a href="../../currencyConversionServlet?currency=AUD" style="color: black; margin-right: 5px; margin-left: 5px;">AUD</a>
						</div>
					</div>
				</div>
				
				<div class="cart-Summary">
					<div class="cart-Summary-row">
						<a>Subtotal:</a>
						<a><%=currency%> <%=String.format("%.2f", (totalPrice)) %></a>
					</div>
					<div class="cart-Summary-row">
						<a>Shipping:</a>
						<a><%=currency%> <%=String.format("%.2f", shipping) %></a>
					</div>
					<div class="cart-Summary-row" style="align-items: center; font-size: 25px;">
						<div class="totalGST" style="display: flex; flex-direction: column; text-align: left">
							<a><b>Total:</b></a>
							<a style="font-size:10px"><b>Including <%=currency%> <%=String.format("%.2f", gst) %> in taxes</b></a>
						</div>
						<a><b><%=currency%> <%=checkoutPrice %></b></a>
					</div>
					
					<div class="promo" style="margin-top: 30px; margin-bottom: 50px">
						<a style="font-size: 18px"><b>Apply Promo Code</b></a>
						<div class="cart-Summary-row" style="display: flex; flex-direction: row; justify-content: center;">
							<input type="text" name="promoCode" id="promoCode" style="padding: 12px 20px;margin: 8px 0; width: 100%; border: none"/>
							<input type="submit" name="promoBtn" value="Apply" style="padding: 12px 50px;margin: 8px 0;background-color: rgb(247, 147, 30);color: white; border: none"/>
						</div>
					</div>
				</div>	
			</div>
		</div>
		
		<form action="../../checkOut">
		<div class="checkOutForm">
		
			<div class="checkOutLists">
				<div class="title-head">
					<a><b>Check Out</b></a><br>
				</div>
				
				<button id="contactInfoBtn" type="button" class="collapsible">Contact Information</button>
				<div class="contactInfo">
					<div class="contactInfoInput">
						<a style="margin-top: 20px;">Email</a>
						<input type="text" name="email" value="<%=email%>" required >
					</div>
					<div class="contactInfoInput" style="margin-bottom: 20px;">
						<a>Phone Number</a>
						<input type="text" name="hp" value="<%=hp%>" required>
					</div>
				</div>
				
				<button id="addressBtn" type="button" class="collapsible2">Delivery Address</button>
				
				<div class="addressInfo" >
					<div class="wrapper">
						<div class="nameInput" style="display: flex; flex-direction: row; margin-top: 20px;">
							<div class="dualInput" style="padding-right: 11px;">
								<a>First Name</a>
								<input type="text" name="firstName" value="<%=firstname%>"required>
							</div>
							<div class="dualInput" style="padding-left: 11px;">
								<a>Last Name</a>
								<input type="text" name="lastName" value="<%=lastname%>"required>
							</div>
						</div>
						
						<div class="contactInfoInput" style="width: 100%;">
							<a>Phone Number</a>
							<input type="number" name="phone" value="<%=phonenumber%>"required>
						</div>
						
						<div class="contactInfoInput" style="width: 100%;">
							<a>Address Line 1</a>
							<input type="text" name="addressLn1" value="<%=addressln1%>" required>
						</div>
						
						<div class="contactInfoInput" style="width: 100%;">
							<a>Address Line 2 (Optional)</a>
							<input type="text" name="addressLn2" value="<%=addressln2%>">
						</div>	
										
						<div class="contactInfoInput" style="width: 100%;">
							<a>City</a>
							<input type="text" name="city" value="<%=city%>"required>
						</div>
						
						<div class="nameInput" style="display: flex; flex-direction: row; align-item: baseline;">
							<div class="dualInput">
								<a>Country</a>
								<select id="country" name="country"required style="font-size: 11.7px">
								<option value="<%=country%>" selected="selected"><%=country%></option>
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
							<div class="dualInput" style="padding-left: 10px; margin-bottom: 20px;">
								<a>Postal Code</a>
								<input type="text" name="postal" value="<%=postalcode%>" required>
							</div>			
						</div>
					</div>
				</div>
				
				
				
				<button id="cardInfoBtn" type="button" class="collapsible3">Payment</button>
				<div class="cardInfo">
					
				
					<div class="cardInfoWrapper" style="width: 100%; margin-top: 20px;">
						<a>Cardholder's Name</a>
						<input type="text" name="cardName" required/>
					</div>

					<div class="cardInfoWrapper" style="width: 100%;">	
						<a>Card Number</a>
						<input name="cardNum" type="tel" inputmode="numeric" pattern="[0-9\s]{13,19}" autocomplete="cc-number" maxlength="19" placeholder="xxxx xxxx xxxx xxxx" required>
					</div>
					
					<div class="cardInfoWrapper" style="flex-direction: row; width: 100%;">	
						<div class="expiryWrap" style="display: flex; flex-direction: column;">
							<a>Valid Thru</a>
							<div class="expiryInputWrap">
								<input name="month" type="text" required/>
								<input name="year" type="text" required/>
							</div>
						</div>
						
						<div class="cvcWrap" style="display: flex; flex-direction: column;">
							<a>CVV / CVC</a>
							<input type="tel" name="cvc" required/>
						</div>
					
					</div>
				<input type="submit" name="submitBtn" value="Check Out Securely" style="margin-bottom: 20px;"/>
				</div>
			</div>
		</div>
		</form>
		
		
	</div>
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

</script>
</html>