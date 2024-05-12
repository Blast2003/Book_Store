package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderIplm;
import com.DAO.CartDaoIplm;
import com.DB.DBconnect;
import com.entity.Book_Order;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			
			HttpSession session = req.getSession();
			
			int id = Integer.parseInt(req.getParameter("uid"));
			
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");
			
			String fullAdd = address+","+landmark+","+city+","+state+","+pincode; 
			
//			System.out.println(name+" "+email+" "+phno+" "+fullAdd+" "+paymentType);
			
			CartDaoIplm dao = new CartDaoIplm(DBconnect.getCon());
			
			List<Cart> blist =dao.getBookByUser(id);
			
			if(blist.isEmpty()) {
				session.setAttribute("failedMsg", "Add Item");
				res.sendRedirect("checkout.jsp");
			}else {
				
				BookOrderIplm dao2 = new BookOrderIplm(DBconnect.getCon());
				Book_Order o = null;
				
				ArrayList<Book_Order> order_list = new ArrayList<Book_Order>();
				
				Random r  = new Random();
				
				for(Cart c:blist) {
					o = new Book_Order();
					o.setOrderId("BOOK-ORD-00"+r.nextInt(1000));
					o.setUsername(name);
					o.setEmail(email);
					o.setFulladd(fullAdd);
					o.setPhono(phno);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
					
					order_list.add(o);
				}
				
//				for(Book_Order o1: order_list) {
//					System.out.println(o1);
//				}
				
				if("noselect".equals(paymentType)) {
					session.setAttribute("failedMsg", "Please Choose Payment Method");
					res.sendRedirect("checkout.jsp");
				} else {
					boolean f = dao2.saveOrder(order_list);
					if(f) {
						res.sendRedirect("order_success.jsp");
					}else {
						session.setAttribute("failedMsg", "Your Order Failed");
						res.sendRedirect("checkout.jsp");
					}
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
