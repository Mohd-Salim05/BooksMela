package com.booksmela.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookmela.entites.User;
import com.booksmela.dao.UserDao;
import com.booksmela.helper.ConnectionProvider;

@MultipartConfig
public class ProfileEditServlet extends HttpServlet {

	
	private static final long serialVersionUID=1L;
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int uid=Integer.parseInt(req.getParameter("user_id"));
		String email=req.getParameter("user_email");
		String address=req.getParameter("user_address");
		String number=req.getParameter("user_number");
		
		User user=new User();
		user.setUid(uid);
		user.setUemail(email);
		user.setUaddress(address);
		user.setUm_number(number);
		
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		if(dao.updateUser(user)) {
			resp.getWriter().write("done");
		}else {
			resp.getWriter().write("error");
		}
		
	}
	
	
}
