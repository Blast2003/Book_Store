<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-book: Login</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #b9f6ca;">
	<%@include file="all_component/navbar.jsp" %>
	
	<div class="container p-2">
		<div class ="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					
					<h3 class="text-center">Login Page</h3>
					
					
						<!-- Use for Login fail -->
						<c:if test="${not empty failedMsg }">
							<h5 class="text-center text-danger">${ failedMsg }</h5>
							<c:remove var="failedMsg" scope="session"/>
						</c:if>
						
						
						<!-- Use for Logout Success -->
						<c:if test="${not empty successMsg }">
							<h5 class="text-center text-success">${ successMsg }</h5>
							<c:remove var="successMsg" scope="session"/>
						</c:if>
					
						<form action="login" method="post">
						
						  <div class="form-group">
						    <label for="exampleInputEmail1">Email address</label>
						    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
						  </div>
						  
						  <div class="form-group">
						    <label for="exampleInputPassword1">Password</label>
						    <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
						  </div>
	  
						  <div class="text-center">
						  	<button type="submit" class="btn btn-primary">Login</button><br>	
						  	<a href="register.jsp">Create Account</a>
						  </div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>