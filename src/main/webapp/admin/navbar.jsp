<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<div class="container-fluid" style="height:10px; background-color: #33691e"></div>

<div class="container-fluid p-3 bg-light"> 
	<div class="row">
		<div class="col-md-6 text-primary">
			<h3><i class="fa-solid fa-book"></i> E-books</h3>	
		</div>
		
		
		<div class="col-md-3 offset-md-3">
		
		<c:if test="${not empty userobj}">
			<a class="btn btn-success text-white">
			<i class="fa-solid fa-user-tie"></i> ${userobj.name}</a>
			
			<!-- Logout modal inside this file -->	
			<a data-toggle="modal" data-target="#exampleModal" 
				class="btn btn-primary text-white">
			<i class="fa-solid fa-right-to-bracket"></i> Logout</a>
		</c:if>
		
		<c:if test="${empty userobj}">
			<a href="../login.jsp" class="btn btn-success">
			<i class="fa-solid fa-right-to-bracket"></i> Login</a>
			
			<a href="../register.jsp" class="btn btn-primary text-white">
			<i class="fa-solid fa-user-plus"></i> Register</a>
		</c:if>
		
		</div>	
		
	</div>
</div>

		<!-- Logout modal -->		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel"></h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <div class="text-center">
		        	<h4>Do you want logout</h4>
			        <button type="button" class="btn btn-secondary text-white" data-dismiss="modal">Close</button>
			        <a href="../logout" type="button" class="btn btn-primary text-white">Logout</a>
		        </div>
		      </div>
		      	<div class="modal-footer">
		     	</div>
		    </div>
		  </div>
		</div>
		<!-- End Logout modal -->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home.jsp">Home<span class="sr-only">(current)</span></a>
      </li>
     </ul>
    <form class="form-inline my-2 my-lg-0">
      <a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i class="fa-solid fa-gear"></i> Setting</a>
      <a href="" class="btn btn-light my-2 my-sm-0 ml-2" type="submit"><i class="fa-solid fa-phone"></i> Contact us</a>
    </form>
  </div>
</nav>