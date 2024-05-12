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
<title>Old Book</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #f7faf8;">
<%@include file="all_component/navbar.jsp" %>
	<c:if test="${empty userobj}">
			<c:redirect url="login.jsp"/>
	</c:if>
	
	<!-- Check for deleting successfully or not --> 
	<c:if test="${not empty successMgs }">
		<div class="text-center text-success" role="alert">${successMgs }</div>
		<c:remove var="successMgs" scope="session"/>
	</c:if>

	<c:if test="${ not empty failedMsg }">
		<div class="alert alert-danger" role="alert">${failedMsg }</div>
		<c:remove var="failedMsg" scope="session"/>
	</c:if>
	
	<div class="container p-5">
		<table class="table table-striped">
			  <thead class="bg-success	 text-white">
			    <tr>
			      <th scope="col">Book Name</th>
			      <th scope="col">Author</th>
			      <th scope="col">Price</th>
			      <th scope="col">Category</th>
			      <th scope="col">Action</th>
			    </tr>
			  </thead>
			  
			  <tbody>
			  
			  <%
			  	User u = (User)session.getAttribute("userobj");
			  	String email = u.getEmail();
			  	BookDaoIplm dao = new BookDaoIplm(DBconnect.getCon());
			  	List<BookDtls> list = dao.getBookByOld(email, "Old");
			  	for(BookDtls b :list){%>
			  		
			  	<tr>
			      <td><%=b.getBookname() %></td>
			      <td><%=b.getAuthor() %></td>
			      <td><%=b.getPrice() %></td>
			      <td><%=b.getBookCategory() %></td>
			      <td><a href="delete_old_book?em=<%=email%>&&bid=<%=b.getBookId()%>" 
			      class="btn btn-lr btn-warning">Delete</a></td>
			    </tr>
			  		
			  <%}
			  %>
			  
			    
			    
			    
			  </tbody>
		</table>
	</div>
	
	
</body>
</html>