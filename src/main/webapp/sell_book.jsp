<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Book</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #b9f6ca;">
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"/>
	</c:if>
	<%@include file="all_component/navbar.jsp" %>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					
						<h5 class="text-center text-danger">Sell Old Book</h5>
						
						<c:if test="${not empty successMgs }">
							<p class="text-center text-success">${ successMgs }</p>
							<c:remove var="successMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${ failedMsg }</p>
							<c:remove var="failedMsg" scope="session"/>
						</c:if>
						
						<form action="add_old_book" method="post" enctype="multipart/form-data">
							  
							  
							  <input type="hidden" value="${userobj.email}" name="user">	
							  
							  <div class="form-group">
							    <label for="exampleInputEmail1">Book Name*</label>
							    <input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
							  </div>	
							
							  <div class="form-group">
							    <label for="exampleInputEmail1">Author Name*</label>
							    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="author">
							  </div>
							  
							  <div class="form-group">
							    <label for="exampleInputEmail1">Price*</label>
							    <input type="number" class="form-control" id="exampleInputPassword1" name="price">
							  </div>
							  
							 
							   <div class="form-group">
							    <label for="exampleFormControlFile1">Upload Image</label>
							    <input type="file" class="form-control-file" id="exampleFormControlFile1" name="bimg">
							  </div>
							  
							  <button type="submit" class="btn btn-primary">Sell</button>
						  
						</form>	
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>