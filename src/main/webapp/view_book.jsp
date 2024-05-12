<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.BookDaoIplm"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp" %>
<style type="text/css">
.crd-ho:hover{
	background-color: #f7faf8;
}
</style>
</head>
<body style="background-color: #f0f1f2">
<%User user = (User) (session.getAttribute("userobj")); %>
<%@include file="all_component/navbar.jsp" %>

	<%
		int bid = Integer.parseInt(request.getParameter("bid"));
		BookDaoIplm dao = new BookDaoIplm(DBconnect.getCon());
		BookDtls b = dao.getBookById(bid);
	%>
	
	<div class ="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="book/<%=b.getPhoto()%>" style="height:130px;width:110px"><br>
				<h4 class="mt-3">Book Name: <span class="text-success"><%=b.getBookname() %></span></h4>
				<h4>Author Name: <span class="text-success"><%=b.getAuthor() %></span></h4>
				<h4>Category: <span class="text-success"><%=b.getBookCategory() %></span></h4>
			</div>
			
			
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookname() %></h2>
				
					<%
					if("Old".equals(b.getBookCategory())){%>
					<h5 class="text-primary">Contact To Seller</h5>
					<h5 class="text-primary"><i class="fa-regular fa-envelope"></i> Email: <%=b.getUser_email() %></h5>		
						
				 <%}
				%>
				
				<div class="row ">
					<div class="col-md-4 text-success text-center p-2">
						<i class="fa-solid fa-money-bill-wave fa-3x"></i>
						<p>Cash On Delivery</p>
					</div>
					
					<div class="col-md-4 text-success text-center p-2">
						<i class="fa-solid fa-arrow-rotate-left fa-3x"></i>
						<p>Return Available</p>
					</div>
					
					<div class="col-md-4 text-success text-center p-2">
						<i class="fa-solid fa-truck fa-3x"></i>
						<p>Free Shipping</p>
					</div>

				</div>
				
				<%
					if("Old".equals(b.getBookCategory())){%>
					<div class="text-center p-3">
						<a href="index.jsp" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i> Continue Shopping</a>
						<a href="" class="btn btn-success"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
					</div>		
						
				 <%} else{%>
					 <div class="text-center p-3">
								<% 
								if(user != null){
								%>
									<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=user.getId()%>" 
									class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
									
								<%
								} else{
								%>
									<a href="login.jsp" class="btn btn-danger">Add Cart</a>
								<% 
								}
								%>
						<a href="" class="btn btn-success"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
					</div>
				<%}
				%>
				
				
			</div>	
		</div>
	</div>

</body>
</html>