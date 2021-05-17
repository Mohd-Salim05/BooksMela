<%@page import="com.booksmela.helper.ConnectionProvider"%>
<%@page import="com.booksmela.dao.ProductDao"%>
<%@page import="com.bookmela.entites.Products"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
         int pid=Integer.parseInt(request.getParameter("pid"));
    
        ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
          
        Products prd=dao.getProductsByPid(pid);
         session.setAttribute("cart", prd);
    %>