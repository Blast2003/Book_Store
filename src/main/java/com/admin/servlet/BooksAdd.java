package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDaoIplm;
import com.DB.DBconnect;
import com.entity.BookDtls;


@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		try {
			
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price =req.getParameter("price");
			String bookCategory = req.getParameter("btype");
			String status = req.getParameter("bstatus");
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();
			
			BookDtls b = new BookDtls(bookName,author, price, bookCategory, status, fileName, "admin");
			BookDaoIplm dao = new BookDaoIplm(DBconnect.getCon());
			
			
			boolean f = dao.addBooks(b);
			
			HttpSession session = req.getSession();
			
			if(f) {
				
				String path = getServletContext().getRealPath("")+"book";
				File file = new File(path);
				// auto write path/filename => create new file img to path book/ inside folder of desktop
				part.write(path +File.separator+fileName);
				
				session.setAttribute("successMgs", "Book Add Successfully");
				res.sendRedirect("admin/add_books.jsp");
			}else {
				session.setAttribute("failedMsg", "Something wrong on Server");
				res.sendRedirect("admin/add_books.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
