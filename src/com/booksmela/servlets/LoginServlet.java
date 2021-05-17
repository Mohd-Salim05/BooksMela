package com.booksmela.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookmela.entites.User;
import com.booksmela.dao.UserDao;
import com.booksmela.helper.ConnectionProvider;
import com.booksmela.helper.Message;

@MultipartConfig
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("user_email");
		String pass = req.getParameter("user_password");

		  UserDao dao=new UserDao(ConnectionProvider.getConnection());
		  
		  User user=dao.getUserByEmailAndPassword(email, pass);
		 if(user!=null) {
		  HttpSession session=req.getSession(); 
		  session.setAttribute("user", user);
		
		 // resp.sendRedirect("index.jsp");
		 
		  }else { 
			  HttpSession session=req.getSession();
			  Message msg=new Message("User not present..Please Sigup First", "alert-danger"); 
		      session.setAttribute("msg", msg);
		     // resp.sendRedirect("index.jsp");
		  }
		 

	}

}
