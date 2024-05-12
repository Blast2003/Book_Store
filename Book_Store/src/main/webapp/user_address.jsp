<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Address</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #b9f6ca;">
	<%@include file="all_component/navbar.jsp" %>

	<div class="container">
		<div class="row p-3">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
					
						<h5 class="text-center text-primary">Add Address</h5>
						
						<form action="">
						
						  <div class="form-row">
							  	<div class="form-group col-md-6">
								    <label for="inputPassword3">Address</label>
								    <input type="text" class="form-control" id="inputPassword3" >
							  	</div>
							  	
							  	<div class="form-group col-md-6">
								    <label for="inputPassword3">Landmark</label>
								    <input type="text" class="form-control" id="inputPassword3" >
							  	</div>
						  </div>
						  
						  
						  <div class="form-row">
							  	<div class="form-group col-md-4">
								    <label for="inputPassword3">City</label>
								    <input type="text" class="form-control" id="inputPassword3" >
							  	</div>
							  	
							  	<div class="form-group col-md-4">
								    <label for="inputPassword3">State</label>
								    <input type="text" class="form-control" id="inputPassword3" >
							  	</div>
							  	
							  	<div class="form-group col-md-4">
								    <label for="inputPassword3">Pin</label>
								    <input type="text" class="form-control" id="inputPassword3" >
							  	</div>
  	
						  </div>
						  
						  <div class="text-center">
						  	<button type="submit" class="btn btn-success">Add Address</button>
						  </div>
						  
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	

</body>
</html>