package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDaoIplm;
import com.DB.DBconnect;

@WebServlet("/remove_book")
public class RemoveBookInsideCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int bid = Integer.parseInt(req.getParameter("bid"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		int cid = Integer.parseInt(req.getParameter("cid"));
		CartDaoIplm dao = new CartDaoIplm(DBconnect.getCon());
		boolean f = dao.deteleBook(bid, uid, cid);
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Book Removed from Cart");
			res.sendRedirect("checkout.jsp");
		} else {
			session.setAttribute("failedMsg", "Something wrong on Server");
			res.sendRedirect("checkout.jsp");
		}
	}
	
}
