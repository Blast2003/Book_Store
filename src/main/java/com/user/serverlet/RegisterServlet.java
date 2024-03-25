package com.user.serverlet;

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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			String check = req.getParameter("check");
			
//			System.out.println(name+" "+email+" "+phno+" "+password+" "+check);
			
			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPhno(phno);
			user.setPassword(password);
			
			HttpSession session = req.getSession(); // get session (status) from server
			
			if(check!= null) {
				UserDAOIplm dao = new UserDAOIplm(DBconnect.getCon());
				boolean f= dao.userRegister(user);
				
				//session help to show the status msg after register success or fail
				if(f) {			
					// set attribute for screen on web server
					session.setAttribute("successMsg", "Registration Successfully"); 
					res.sendRedirect("register.jsp");
				} else {				
					// set attribute for screen on web server
					session.setAttribute("failedMsg", "Something wrong in server");
					res.sendRedirect("register.jsp");
				}
			} else {
				// set attribute for screen on web server
				session.setAttribute("failedMsg", "Please check agree & Terms Condition");
				res.sendRedirect("register.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
