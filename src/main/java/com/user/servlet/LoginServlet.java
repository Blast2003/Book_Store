package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOIplm;
import com.DB.DBconnect;
import com.entity.User;


@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			
			UserDAOIplm dao = new UserDAOIplm(DBconnect.getCon());
			
			HttpSession session = req.getSession();
			
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			if("admin@gmail.com".equals(email) && "admin".equals(password)) {
				User user = new User();
				user.setName("Admin");
				session.setAttribute("userobj", user); // userobj = user
				res.sendRedirect("admin/home.jsp");
			}else {
				
				User user = dao.login(email, password);
				if(user != null) {
					session.setAttribute("userobj", user); //userobj = user
					res.sendRedirect("index.jsp");
				}else {
					session.setAttribute("failedMsg", "Email or Password Invalid");
					res.sendRedirect("login.jsp");
				}
			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
