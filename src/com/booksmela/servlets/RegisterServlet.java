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
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID=1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session=req.getSession();
		String name=req.getParameter("uname");
		String email=req.getParameter("email");
		String pass=req.getParameter("password");
		String address=req.getParameter("address");
		String gender=req.getParameter("gender");
		String mobileNumber=req.getParameter("mobile");
		
		
		User user=new User(name, email, pass, address, gender, mobileNumber);
		
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		
		if(dao.saveUser(user)) {
			
			Message msg=new Message("successfully SignUp", "alert-success");
			session.setAttribute("msg", msg);
		}else {
			Message msg=new Message("something went wrong", "alert-danger");
			session.setAttribute("msg", msg);
			resp.sendRedirect("index.jsp");
		}
		
		
	}
	
	
	
}
