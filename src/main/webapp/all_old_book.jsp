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
<title>All Recent Book</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body>
	<%@include file="all_component/navbar.jsp" %>
	<div class="container-fluid">
		<div class="row p-3">

 <%
				BookDAOImpl dao = new BookDAOImpl(DBconnect.getCon());
				List<BookDtls> list = dao.getAllOldBook();
				for(BookDtls b:list)
				{%>
				<div class="col-md-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="book/<%=b.getPhotoName() %>" style="width:100px; height:150px" class="img-thumblin">
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
		</div> 
</body>
</html>