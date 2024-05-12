<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDaoIplm"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Old Book</title>
<%@include file="all_component/allCss.jsp" %>
<style type="text/css">
.crd-ho:hover{
	background-color: #f7faf8;
}

</style>
</head>
<body>
<%User user = (User) (session.getAttribute("userobj")); %>
<%@include file="all_component/navbar.jsp" %>
	<div class="container-fluid">
		<div class ="row p-3">
			<%
					BookDaoIplm dao2 = new BookDaoIplm(DBconnect.getCon());
					List<BookDtls> list2 = dao2.getAllOldBook();
					for(BookDtls b:list2){
					%>
					
					<div class="col-md-3">
						<div class="card crd-ho mt-2">
						<div class="card-body text-center">
							<img alt="" src="book/<%=b.getPhoto()%>" style="width:120px; 
							height:180px" class="img-thumblin">
							<p><%=b.getBookname() %></p> 
							<p><%=b.getAuthor() %></p> 
							<p>Categories:<%=b.getBookCategory() %></p>
							
								<div class="row text-center ml-3 ">

									<a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-danger btn-sm ml-5">View Details</a>
									<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i class="fa-solid fa-indian-rupee-sign"></i></a>
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