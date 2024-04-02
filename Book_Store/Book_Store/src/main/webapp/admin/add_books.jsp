<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Books</title>
<%@include file="allCss.jsp" %>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="cardd-body">
						<h4 class="text-center">Add Books</h4>
						
						<c:if test="${not empty successMgs }">
							<p class="text-center text-success">${ successMgs }</p>
							<c:remove var="successMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${ failedMsg }</p>
							<c:remove var="failedMsg" scope="session"/>
						</c:if>
						
						<form action="../add_books" method="post" enctype="multipart/form-data">
			
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
						    <label for="inputState">Book Categories</label>
							    <select id="inputState" name="btype" class="form-control">
								    <option selected>--select---</option>
								    <option value="New">New Book</option>
							    </select>
						  </div>
						  
						  <div class="form-group">
						    <label for="inputState">Book Status</label>
							    <select id="inputState" name="bstatus" class="form-control">
								    <option selected>--select---</option>
								    <option value="Active">Active</option>
								    <option value="Inactive">Inactive</option>
							    </select>
						  </div>
						  
						   <div class="form-group">
						    <label for="exampleFormControlFile1">Upload Image</label>
						    <input type="file" class="form-control-file" id="exampleFormControlFile1" name="bimg">
						  </div>
						  
						  <button type="submit" class="btn btn-primary">Add</button>
						  
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div style="margin-top: 50px">
		<%@include file="footer.jsp" %>
	</div>

</body>
</html>