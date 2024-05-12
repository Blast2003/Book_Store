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

@WebServlet("/update_profile")
public class UpdateProfile extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			int uid = Integer.parseInt(req.getParameter("uid"));
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			
			HttpSession session = req.getSession();
			
			User user = new User();
			user.setId(uid);
			user.setEmail(email);
			user.setPhno(phno);
			user.setName(name);
			
			UserDAOIplm dao = new UserDAOIplm(DBconnect.getCon());
			boolean f = dao.checkPassword(uid, password);
			if(f) {
				boolean f2 = dao.updateProfile(user);
				if(f2) {
					session.setAttribute("successMsg", "Profile Update Successfully"); 
					res.sendRedirect("Edit_profile.jsp");
				}else {
					session.setAttribute("failedMsg", "Something Wrong On Server"); 
					res.sendRedirect("Edit_profile.jsp");
				}
				
				
			}else {
				session.setAttribute("failedMsg", "Your Password is Incorrect"); 
				res.sendRedirect("Edit_profile.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
}
