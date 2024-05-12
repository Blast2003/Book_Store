package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDaoIplm;
import com.DAO.CartDaoIplm;
import com.DB.DBconnect;
import com.entity.BookDtls;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int bid = Integer.parseInt(req.getParameter("bid"));	
		int uid = 	Integer.parseInt(req.getParameter("uid"));		
		
		
		BookDaoIplm dao = new BookDaoIplm(DBconnect.getCon());
		BookDtls b = dao.getBookById(bid);
		
		Cart cart = new Cart();
		cart.setBid(bid);
		cart.setUserId(uid);
		cart.setBookName(b.getBookname());
		cart.setAuthor(b.getAuthor());
		cart.setPrice(Double.parseDouble(b.getPrice()));
		cart.setTotalPrice(Double.parseDouble(b.getPrice()));
		
		CartDaoIplm dao2 = new CartDaoIplm(DBconnect.getCon());
		boolean f = dao2.addCart(cart);
		
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("addCart", "Book Added To Cart");
			res.sendRedirect("all_new_book.jsp");
			
		}else {
			session.setAttribute("failed", "Something Wrong On Server");
			res.sendRedirect("all_new_book.jsp");
		}
	}
	
}
