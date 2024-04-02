<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="com.entity.*"%>    
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-book: Index</title>
<%@include file="all_component/allCss.jsp" %>
<style type="text/css">
.back-img{
	background: url("img/b.jpg");
	height:60vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
.crd-ho:hover{
	background-color: #f7faf8;
}

</style>
</head>
<body style="background-color: #f7faf8;">
	<%@include file="all_component/navbar.jsp" %>
	<div class="container-fluid back-img">
		<h2 class ="text-center	text-dark">E-book Management System</h2>
	</div>

	
<!-- Start Recent Book -->
	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
		<%
		BookDAOImpl dao2 = new BookDAOImpl(DBconnect.getCon());
		List<BookDtls> list2 =  dao2.getRecentBooks();
		for(BookDtls b:list2)
		{%>
				<div class="col-md-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="book/<%=b.getPhotoName()%>" style="width:150px; height:200px" class="img-thumblin">
							<p><%=b.getBookName() %></p> 
							<p><%=b.getAuthor() %></p> 
							<p>
							
							<%
							if(b.getBookCategory().equals("Old"))
							{%>
								Categories:<%=b.getBookCategory() %></p>
								<div class="row">
								
									<a href="" class="btn btn-danger btn-sm "><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
									<a href="" class="btn btn-danger btn-sm <i class="fa-regular fa-dollar-sign"></i>">View Details</a>
									<a href="" class="btn btn-danger btn-sm "><i class="fa-regular fa-dollar-sign"></i>299</a>
								</div>
								
							<%
							}else{
							%>
							Categories:<%=b.getBookCategory() %></p>
							<div class="row">
								<a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
								<a href="" class="btn btn-danger btn-sm">View Details</a>
								<a href="" class="btn btn-danger btn-sm"><i class="fa-regular fa-dollar-sign"></i>299</a>
							</div>
							<%
							}
							%>

							
							
							
							
						</div>
					</div>
				</div>	
			
		<%
		}		
		%>

						
			</div>
				
			<div class="text-center mt-2">
				<a href="" class="btn btn-danger btn-sm text-white">View All</a>	
			</div>				
			
	</div>
<!-- End Recent Book --> 
	
	<hr>

<!-- Start New Book -->

	<div class="container">
		<h3 class="text-center">New Book</h3>
			<div class="row">
				
				<%
				BookDAOImpl dao = new BookDAOImpl(DBconnect.getCon());
				List<BookDtls> list = dao.getNewBook();
				for(BookDtls b:list)
				{%>
				<div class="col-md-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="book/<%=b.getPhotoName() %>" style="width:150px; height:200px" class="img-thumblin">
							<p><%=b.getBookName() %></p> 
							<p><%=b.getAuthor() %>s</p> 
							<p>Categories:<%=b.getBookCategory() %></p>
							<div class="row">
								<a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
								<a href="" class="btn btn-danger btn-sm ">View Details</a>
								<a href="" class="btn btn-danger btn-sm "><i class="fa-regular fa-dollar-sign"></i><%=b.getPrice() %>
									</a>
							</div>
						</div>
					</div>	
				</div>				
				<%}
	
				%>

			
			</div>
				
			<div class="text-center mt-2">
				<a href="" class="btn btn-danger btn-sm text-white">View All</a>	
			</div>				
			
	</div>
<!-- End New Book --> 

<hr>

<!-- Start Old Book -->
	<div class="container">
		<h3 class="text-center">Old Book</h3>
			<div class="row">
		<%
		BookDAOImpl dao3= new BookDAOImpl(DBconnect.getCon());
		List<BookDtls> list3 =  dao3.getOldBooks();
		for(BookDtls b:list3)
		{%>
				<div class="col-md-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="book/<%=b.getPhotoName()%>" style="width:150px; height:200px" class="img-thumblin">
							<p><%=b.getBookName() %></p> 
							<p><%=b.getAuthor() %></p> 
							<p><%=b.getBookCategory() %></p>
							<div class="row">
								<a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
								<a href="" class="btn btn-danger btn-sm ">View Details</a>
								<a href="" class="btn btn-danger btn-sm "><i class="fa-regular fa-dollar-sign"></i><%=b.getPrice() %></a>
							</div>


						</div>
					</div>
				</div>	
		<%
		}		
		%>
		
			
				
				
				
			
			</div>
				
			<div class="text-center mt-2">
				<a href="" class="btn btn-danger btn-sm text-white mb-2">View All</a>	
			</div>				
			
	</div>
<!-- End Old Book --> 
	
<%@include file="all_component/footer.jsp" %>

</body>
</html>