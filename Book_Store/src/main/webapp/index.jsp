<%@page import="com.mysql.cj.Session"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.BookDaoIplm"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
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

	<%User user = (User) (session.getAttribute("userobj")); %>


	<%@include file="all_component/navbar.jsp" %>
	<div class="container-fluid back-img">
		<h2 class ="text-center	text-dark">E-book Management System</h2>
	</div>

	
<!-- Start Recent Book -->
	<div class="container">
		<h3 class="text-center">Recent Book</h3>
			<div class="row">
				
				
				<%
					BookDaoIplm dao1 = new BookDaoIplm(DBconnect.getCon());
					List<BookDtls> list1 = dao1.getRecentBook();
					for(BookDtls b: list1){
					%>
					
					<div class="col-md-3">
						<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="book/<%=b.getPhoto()%>" style="width:150px; height:200px" class="img-thumblin">
							<p><%=b.getBookname() %></p> 
							<p><%=b.getAuthor() %></p> 
							<p>Categories:<%=b.getBookCategory() %></p>	
							<%
							if( b.getBookCategory().equals("Old")){%>

								<div class="row">
									<a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-danger btn-sm ml-5">View Details</a>
									<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i class="fa-solid fa-indian-rupee-sign"></i></a>
								</div>
							
								<%} else{%>
		
									<div class="row">
									
										<% 
										if(user != null){
										%>
											<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=user.getId()%>" 
											class="btn btn-danger btn-sm "><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
											
										<%
										} else{
										%>
											<a href="login.jsp" class="btn btn-danger btn-sm ">
											<i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
										<% 
										}
										%>	
									
									<a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-danger btn-sm ml-1">View Details</a>
									<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i class="fa-solid fa-indian-rupee-sign"></i></a>
									</div>	
									
								<%}
							%>
							
						</div>
						</div>
					</div>

					<%}
				%>

			</div>
				
			<div class="text-center mt-2">
				<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>	
			</div>				
			
	</div>
<!-- End Recent Book --> 
	
	<hr>

<!-- Start New Book -->
	<div class="container">
		<h3 class="text-center">New Book</h3>
			<div class="row">
				
				<%
					BookDaoIplm dao = new BookDaoIplm(DBconnect.getCon());
					List<BookDtls> list = dao.getNewBook();
					for(BookDtls b:list){
					%>
					
					<div class="col-md-3">
						<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="book/<%=b.getPhoto()%>" style="width:150px; height:200px" class="img-thumblin">
							<p><%=b.getBookname() %></p> 
							<p><%=b.getAuthor() %></p> 
							<p>Categories:<%=b.getBookCategory() %></p>
							<div class="row">
								
								<% 
								if(user != null){
								%>
									<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=user.getId()%>" 
									class="btn btn-danger btn-sm "><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
									
								<%
								} else{
								%>
									<a href="login.jsp" class="btn btn-danger btn-sm ">
									<i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
								<% 
								}
								%>

								
								<a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-danger btn-sm ml-1">View Details</a>
								<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i class="fa-solid fa-indian-rupee-sign"></i></a>
							
							</div>
						</div>
						</div>
					</div>

					<%}
				%>
		
				</div>
				
			<div class="text-center mt-2">
				<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>	
			</div>				
			
	</div>
<!-- End New Book --> 

<hr>

<!-- Start Old Book -->
	<div class="container">
		<h3 class="text-center">Old Book</h3>
			<div class="row">
				
				
				<%
					BookDaoIplm dao2 = new BookDaoIplm(DBconnect.getCon());
					List<BookDtls> list2 = dao2.getOldBook();
					for(BookDtls b:list2){
					%>
					
					<div class="col-md-3">
						<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="book/<%=b.getPhoto()%>" style="width:150px; 
							height:200px" class="img-thumblin">
							<p><%=b.getBookname() %></p> 
							<p><%=b.getAuthor() %></p> 
							<p>Categories:<%=b.getBookCategory() %></p>
	
							<div class="row">
								<a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-danger btn-sm ml-5">View Details</a>
								<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i class="fa-solid fa-indian-rupee-sign"></i></a>
							</div>	

								
							</div>
							</div>
						</div>
					

					<%}
				%>
		
				
			
			</div>
				
			<div class="text-center mt-2">
				<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white mb-2">View All</a>	
			</div>				
			
</div>
<!-- End Old Book --> 

</body>

<footer>
	<div>
		<%@include file="all_component/footer.jsp" %>
	</div>
</footer>
</html>