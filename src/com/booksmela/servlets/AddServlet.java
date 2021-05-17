package com.booksmela.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bookmela.entites.Products;
import com.booksmela.dao.ProductDao;
import com.booksmela.helper.ConnectionProvider;

@MultipartConfig
public class AddServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int cid=Integer.parseInt(req.getParameter("cid"));
		String name=req.getParameter("pname");
		String pdesc=req.getParameter("pdesc");
		double price=Double.parseDouble(req.getParameter("pprice"));
		float discount=Float.parseFloat(req.getParameter("pdis"));
		Part part=req.getPart("pimg");
		String img=part.getSubmittedFileName();
		
		
		//resp.getWriter().write(img);
		Products pds=new Products(name, pdesc, price, discount, cid, img);
		
		ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
		
		if(dao.insertProduct(pds)) {
			resp.getWriter().write("done");
		}
	}

}
