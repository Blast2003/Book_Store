package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDaoIplm;
import com.DB.DBconnect;


@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			String email =req.getParameter("em");
			int bid = Integer.parseInt(req.getParameter("bid"));
			
			BookDaoIplm dao = new BookDaoIplm(DBconnect.getCon());
			boolean f= dao.oldBookDelete(email, "Old", bid);
			
			HttpSession session = req.getSession();
			if(f) {
				session.setAttribute("successMgs", "Old Book Delete Successfully");
				res.sendRedirect("old_book.jsp");
			}else {
				session.setAttribute("failedMsg", "Something Wrong on server");
				res.sendRedirect("old_book.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
