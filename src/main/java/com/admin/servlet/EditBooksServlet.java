package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDaoIplm;
import com.DB.DBconnect;
import com.entity.BookDtls;

@WebServlet("/editbooks")
public class EditBooksServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		try {
			int id = Integer.parseInt(req.getParameter("id"));
 			String BookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String status = req.getParameter("status");
			
			BookDtls b = new BookDtls();
			b.setBookId(id);
			b.setBookname(BookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			BookDaoIplm dao = new BookDaoIplm(DBconnect.getCon());
			boolean f = dao.UpdateEditBooks(b);
			
			HttpSession session = req.getSession();
			if(f) {
				session.setAttribute("successMsg", "Book Update Successfully");
				res.sendRedirect("admin/all_books.jsp");
			}else {
				session.setAttribute("failedMsg", "Something Wrong on server");
				res.sendRedirect("admin/all_books.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
