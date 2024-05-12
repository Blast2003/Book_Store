<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Setting Page</title>
<%@include file="all_component/allCss.jsp" %>
<style type="text/css">
	a{
		text-decoration: none;
		color:black;
	}
	
	a:hover{
		text-decoration: none;
	}
</style>
</head>
<body style="background-color: #f7faf8;">

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"/>
	</c:if>

	<%@include file="all_component/navbar.jsp" %>
	
	<div class="container">
		<h3 class="text-center p-3">Hello ${userobj.name}</h3>
		
		<div class="row p-5">
			
			<div class="col-md-4">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-success ">
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h3>Sell Old Book</h3>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="old_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-success ">
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h3>Old Book</h3>
						</div>
					</div>
				</a>
			</div>
			
			
			<div class="col-md-4">
				<a href="Edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-success ">
								<i class="fa-solid fa-user-pen fa-3x"></i>
							</div>
							<h3>Edit Profile</h3>
						</div>
					</div>
				</a>
			</div>
			
		
			
			<div class="col-md-6 mt-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h3>My Order</h3>
							<p>Track Your Order</p>
						</div>
					</div>
				</a>
			</div>
			
			
			<div class="col-md-6 mt-3">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fa-solid fa-person-shelter fa-3x"></i>
							</div>
							<h3>Help Center</h3>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
			</div>
		
		
		</div>
	</div>
	
</body>
<footer>
	<div>
		<%@include file="all_component/footer.jsp" %>
	</div>
</footer>
</html>