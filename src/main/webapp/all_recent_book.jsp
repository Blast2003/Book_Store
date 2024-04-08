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
		BookDAOImpl dao2 = new BookDAOImpl(DBconnect.getCon());
		List<BookDtls> list2 =  dao2.getAllRecentBook();
		for(BookDtls b:list2)
		{%>
				<div class="col-md-3">
					<div class="card crd-ho mt-2 ">
						<div class="card-body text-center">
							<img alt="" src="book/<%=b.getPhotoName()%>" style="width:100px; height:150px" class="img-thumblin">
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
		</div> 
</body>
</html>