<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.CartDaoIplm"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-book: Cart Page</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #b9f6ca;">
	<%@include file="all_component/navbar.jsp" %>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<!-- Check for deleting successfully or not --> 
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">${succMsg }</div>
		<c:remove var="succMsg" scope="session"/>
	</c:if>

	<c:if test="${ not empty failedMsg }">
		<div class="alert alert-danger text-center" role="alert">${failedMsg }</div>
		<c:remove var="failedMsg" scope="session"/>
	</c:if>

	<div class ="container">
		<div class = "row p-2">
			<div class="col-md-6"> 
				
					<div class="card bg-white">
						<div class="card-body"> 
							<h3 class="text-center text-success">Your Selected Item</h3>
							<table class="table table-striped">
								  <thead>
								    <tr>
								      <th scope="col">Book Name</th>
								      <th scope="col">Author</th>
								      <th scope="col">Price</th>
								      <th scope="col">Action</th>
								    </tr>
								  </thead>
								  <tbody>
								  
								  <%
								  User u = (User) session.getAttribute("userobj");
								  CartDaoIplm dao = new CartDaoIplm(DBconnect.getCon());
								  List<Cart> cart = dao.getBookByUser(u.getId());
								  Double totalPrice = 0.00;
								  
								  for(Cart c:cart){ 
								  	totalPrice=c.getTotalPrice();
								  %> 
									  <tr>
								      <th scope="row"><%=c.getBookName()%></th>
								      <td><%=c.getAuthor() %></td>
								      <td><%=c.getPrice() %></td>
								      <td>
								      	<a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>" 
								      	class="btn btn-sm btn-danger">Remove</a>
								      </td>
								    </tr>
								 <%}
								  %>
	    						 	<tr>
								      <td>Total Price</td>
								      <td></td>
								      <td></td>
								      <td><%=totalPrice%></td>
								    </tr>
	    						
						</table>
						</div>
					</div>
			</div>
			
			
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details for Order </h3>
						<form action ="order" method="post">
						
						<input type="hidden" value="${userobj.id }" name="uid">
							<div class="form-row">
						  	<div class="form-group col-md-6">
							    <label for="inputPassword3">Name</label>
							    <input type="text" name="username" class="form-control" id="inputPassword3 " 
							    value="${userobj.name}" required>
						  	</div>
						  	
						  	<div class="form-group col-md-6">
							    <label for="inputPassword3">Email</label>
							    <input type="email" name="email" class="form-control" id="inputEmail3" 
							    value="${userobj.email}" required>
						  	</div>
						  </div>
						  
						  
						  <div class="form-row">
						  	<div class="form-group col-md-6">
							    <label for="inputPassword3">Phone Number</label>
							    <input type="number" name="phno" class="form-control" id="inputPassword3" 
							    value="${userobj.phno}" required>
						  	</div>
						  	
						  	<div class="form-group col-md-6">
							    <label for="inputPassword3">Address</label>
							    <input type="text" name="address" class="form-control" id="inputPassword3" required>
						  	</div>
						  </div>
						  
						  
						  <div class="form-row">
						  	<div class="form-group col-md-6">
							    <label for="inputPassword3">Landmark</label>
							    <input type="text" name="landmark" class="form-control" id="inputPassword3" required>
						  	</div>
						  	
						  	<div class="form-group col-md-6">
							    <label for="inputPassword3">City</label>
							    <input type="text" name="city" class="form-control" id="inputPassword3" required>
						  	</div>
						  </div>
						  
						  
						  <div class="form-row">
						  	<div class="form-group col-md-6">
							    <label for="inputPassword3">State</label>
							    <input type="text" name="state" class="form-control" id="inputPassword3" required>
						  	</div>
						  	
						  	<div class="form-group col-md-6">
							    <label for="inputPassword3">Pin Code</label>
							    <input type="text" name="pincode" class="form-control" id="inputPassword3" required>
						  	</div>
						  </div>
						  
						  <div class="form-group">
						  	<label>Payment Type</label>
						  	<select class="form-control" name="payment">
						  		<option value="noselect">--Select--</option>
						  		<option value="COD">Cash on Delivery</option>
						  	</select>
						  </div>
						  
						  
						  <div class="text-center">
						  	<button class="btn btn-warning">Order Now</button>
						  	<a href="index.jsp" class="btn btn-success">Continue Shopping</a>
						  </div>
						  
						</form>
						
					</div>
				</div>
			</div>
		
		
		</div>
	</div>


</body>
</html>